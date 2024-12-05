package util;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CountryResponse;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;

public class CountryIdentifier {

    private DatabaseReader dbReader;
//    String mmdbFilepath = "C:/Users/ADMIN/eclipse-workspace/BookWeb-master/src/main/java/util/GeoLite2-Country (1).mmdb";

    public CountryIdentifier() throws IOException {
        // Khởi tạo DatabaseReader từ đường dẫn đến file GeoIP2 database

//        File database = new File(mmdbFilepath);
        InputStream database = getClass().getClassLoader().getResourceAsStream("GeoLite2-Country (1).mmdb");
        this.dbReader = new DatabaseReader.Builder(database).build();
    }

    public String getCountryId(HttpServletRequest request) throws IOException, GeoIp2Exception {
        // Lấy địa chỉ IP của client từ request
        String clientIpAddress = getClientIpAddress(request);
        //System.out.println("clientIpAddress: "+ clientIpAddress);
        String ipv4 = IPv4Converter.convertIPv4(clientIpAddress);

        // Chuyển đổi địa chỉ IP từ dạng string sang đối tượng InetAddress
        InetAddress ip = InetAddress.getByName(ipv4);

        // Truy vấn thông tin địa lý của địa chỉ IP
        CountryResponse responsee = dbReader.country(ip);

        // In thông tin về quốc gia
        //System.out.println("Country Name: " + responsee.getCountry().getName());
        //System.out.println("Country ISO Code: " + responsee.getCountry().getIsoCode());
        String rs = responsee.getCountry().getName();
        if (rs.equals("United States")) rs = "Viet Nam";
        return rs;

    }

//    public String getCountryId2(String request) throws IOException, GeoIp2Exception {
//        // Lấy địa chỉ IP của client từ request
//        String ipv4 = IPv4Converter.convertIPv4(request);
//
//        // Chuyển đổi địa chỉ IP từ dạng string sang đối tượng InetAddress
//        InetAddress ip = InetAddress.getByName(ipv4);
//
//        // Truy vấn thông tin địa lý của địa chỉ IP
//        CountryResponse responsee = dbReader.country(ip);
//
//        // In thông tin về quốc gia
//        //System.out.println("Country Name: " + responsee.getCountry().getName());
//        //System.out.println("Country ISO Code: " + responsee.getCountry().getIsoCode());
//        return responsee.getCountry().getName();
//
//    }

    // Lấy địa chỉ IP của client từ request
    public String getClientIpAddress(HttpServletRequest request) {
        // Lấy địa chỉ IP của client từ HTTP request
        String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }

        return ipAddress;

    }

}


