package controller.user.changeInfo;

import database.UserDAO;
import model.User;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import util.ConfigUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChangeAvartar", value = "/ChangeAvartar")
public class ChangeAvartar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(request);
                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        File uploadedFile = new File(repository, fileName);
                        item.write(uploadedFile);

                        // Tạo thumbnail
                        Thumbnails.of(uploadedFile).size(150, 150)
                                .outputQuality(0.75)
                                .toFile(new File(repository, "thumb_" + fileName));

                        // Đường dẫn đến thư mục lưu ảnh avatar
                        String webAppPath = ConfigUtil.getProperty("ADDRESS_IMAGE");
                        File imgDir = new File(webAppPath + "avatars");
                        if (!imgDir.exists()) {
                            imgDir.mkdir();
                        }

                        // Di chuyển file đến thư mục avatars
                        File newFile = new File(imgDir, fileName);
                        FileUtils.moveFile(uploadedFile, newFile);

                        // Lấy user từ session hoặc cơ sở dữ liệu
                        HttpSession session = request.getSession();
                        User user = (User) session.getAttribute("userC");
                        if (user != null) {
                            user.setAvatar("avatars/" + fileName);
                            new UserDAO(request).updateAvatar(user);
                        }
                    }
                }
            } catch (Exception e) {
                throw new ServletException("Cannot upload file", e);
            }
        }

        response.sendRedirect(request.getContextPath() + "/Profile");
    }
}