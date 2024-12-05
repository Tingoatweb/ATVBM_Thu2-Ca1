package controller.admin.coupon;

import database.CouponDAO;
import database.CouponTypeDAO;
import model.Coupon;
import model.CouponType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "AddCoupon", value = "/AddCoupon")
public class AddCoupon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String valueDiscountString = request.getParameter("discountValue");
        double valueDiscount = Double.parseDouble(valueDiscountString);
        String discountTypeIdString = request.getParameter("discountType");
        int discountTypeId = Integer.parseInt(discountTypeIdString);
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String maxUseCouponString = request.getParameter("maxUseOfCoupon");
        String maxUseUserCouponString = request.getParameter("maxQuantityUseOfUser");
        int maxUserCoupon = Integer.parseInt(maxUseCouponString);
        int maxUseUserCoupon = Integer.parseInt(maxUseUserCouponString);
        String minTotalString = request.getParameter("minTotalPrice");
        double minTotal = Double.parseDouble(minTotalString);
        String maxTotalString = request.getParameter("maxTotalPrice");
        double maxTotal = Double.parseDouble(maxTotalString);
        String minQuantityString = request.getParameter("minQuantity");
        int minQuantity = Integer.parseInt(minQuantityString);

        if (!startDate.contains(" ")) {
            startDate += " 00:00:00";
        }
        if (!endDate.contains(" ")) {
            endDate += " 23:59:59";
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            java.util.Date parsedStartDate = sdf.parse(startDate);
            java.util.Date parsedEndDate = sdf.parse(endDate);

            Timestamp startDatee = new Timestamp(parsedStartDate.getTime());
            Timestamp endDatee = new Timestamp(parsedEndDate.getTime());

            CouponDAO couponDAO = new CouponDAO();
            CouponTypeDAO couponTypeDAO = new CouponTypeDAO();
            CouponType couponType = couponTypeDAO.selectById(discountTypeId);

            Coupon coupon = new Coupon(couponDAO.creatId()+1,code,couponType, valueDiscount, startDatee, endDatee, minTotal, maxUserCoupon, maxUseUserCoupon, minQuantity, maxTotal);
            couponDAO.insert(coupon);

            response.sendRedirect(request.getContextPath() + "/ListCoupon");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Invalid date format");
        }
    }
}