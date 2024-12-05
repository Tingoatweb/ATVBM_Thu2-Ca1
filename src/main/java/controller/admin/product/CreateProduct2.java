package controller.admin.product;

import database.CategoryDAO;
import database.ProductDAO;
import model.Category;
import model.Product;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import util.ConfigUtil;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CreateProduct2", value = "/CreateProduct2")
public class CreateProduct2 extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xu ly yeu cau GET neu can
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Bat dau xu ly yeu cau");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        String productName = null;
        String categoryName = null;
        String author = null;
        String publicationYear = null;
        String description = null;
        String publisher = null;
        String uploadedFileName = null;
        String price = null;
        if (isMultipart) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                // Phan tich request va lay cac phan tu
                List<FileItem> items = upload.parseRequest(request);
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Xu ly cac truong form
                        switch (item.getFieldName()) {
                            case "product_name":
                                productName = item.getString("UTF-8");
                                break;
                            case "category":
                                categoryName = item.getString("UTF-8");
                                break;
                            case "author":
                                author = item.getString("UTF-8");
                                break;
                            case "publicationYear":
                                publicationYear = item.getString("UTF-8");
                                break;
                            case "description":
                                description = item.getString("UTF-8");
                                break;
                            case "publisher":
                                publisher = item.getString("UTF-8");
                                break;
                            case "price":
                                price = item.getString("UTF-8");
                                break;
                        }
                    } else {
                        // Xu ly file upload
                        String fileName = item.getName();
                        File uploadedFile = new File(repository, fileName);
                        item.write(uploadedFile);
                        // Tao thumbnail cho file upload
                        Thumbnails.of(uploadedFile).size(500, 1000)
                                .outputQuality(0.75)
                                .toFile(new File(repository, "thumb_" + fileName));

                        // Thu muc dich trong thu muc goc cua ung dung web
                        String webAppPath = ConfigUtil.getProperty("ADDRESS_IMAGE");
                        File imgDir = new File(webAppPath + "image");
                        System.out.println(imgDir);
                        if (uploadedFile.exists()) {
                            // Xoa tap tin dich neu ton tai
                            File existingFile = new File(imgDir, fileName);
                            if (existingFile.exists()) {
                                existingFile.delete();
                            }
                        }
                        // Tao thu muc neu chua ton tai
                        if (!imgDir.exists()) {
                            imgDir.mkdir();
                        }
                        // Di chuyen file den thu muc dich
                        File newFile = new File(imgDir, fileName);
                        FileUtils.moveFile(uploadedFile, newFile);
                        uploadedFileName = fileName;
                    }
                }

                // Kiem tra cac gia tri can thiet
                if (productName != null && categoryName != null && author != null && publicationYear != null &&
                        description != null && publisher != null && uploadedFileName != null) {

                    // Lay category tu ten
                    Category category = new CategoryDAO().selectByName(categoryName);

                    // Tao ProductDAO de quan ly san pham
                    ProductDAO productDAO = new ProductDAO(request);
                    // Tao doi tuong san pham moi va chen vao co so du lieu
                    Product product = new Product(productDAO.creatId() + 1, productName, description,
                            uploadedFileName, 0, Double.parseDouble(price), 0, author, Integer.parseInt(publicationYear), publisher, category);

                    productDAO.insert(product);
                    System.out.println("Hoan thanh");
                } else {
                    throw new ServletException("Thieu thong tin san pham");
                }
            } catch (Exception e) {
                throw new ServletException("Khong the tai len", e);
            }
        }

        // Chuyen huong den trang danh sach san pham
        request.getRequestDispatcher("/WEB-INF/admin/jsp/listProduct.jsp").forward(request, response);
    }
}
