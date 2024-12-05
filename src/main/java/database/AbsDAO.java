package database;

import com.google.gson.Gson;
//import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import model.Log;
import util.CountryIdentifier;
import util.IPv4Converter;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class AbsDAO <T> implements DAOInterface<T> {
    //    private String nameOfTable="";
    private String preValue="";
    private String value="";
    private String ipAddress="";
    private String national = "";
    Gson gson = new Gson();
    HttpServletRequest request;

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public AbsDAO(HttpServletRequest request) {
        this.request=request;
        System.out.println(request.getLocalPort());
    }

    public AbsDAO() {
    }
    public String getPreValue() {
        return preValue;
    }

    public void setPreValue(String preValue) {
        this.preValue = preValue;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getNational() {

        String countryId ="";

        try {
            CountryIdentifier countryIdentifier = new CountryIdentifier();
            countryId = countryIdentifier.getCountryId(request);
        } catch (IOException | GeoIp2Exception e) {
            throw new RuntimeException(e);
        }
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        return countryId;
    }

    public void setNational(String national) {
        this.national = national;
    }

    @Override
    public ArrayList<T> selectAll() {

        return null;
    }

    @Override
    public T selectById(int id) {
        return null;
    }

    @Override
    public int insert(T t) {
        LogDAO logDAO = new LogDAO();
        Log log = new Log(logDAO.creatId(), "INFO",LocalDateTime.now(), this.getIpAddress(), null, value, getNational());
        new LogDAO().update(log);
        return 0;
    }

    @Override
    public int insertAll(ArrayList<T> list) {
        return 0;
    }

    @Override
    public int delete(T t) {
        LogDAO logDAO = new LogDAO();

        Log log = new Log(logDAO.creatId(), "WARNING",LocalDateTime.now(), this.getIpAddress(), null, value, getNational());
        new LogDAO().insert(log);
        return 0;
    }

    public int WARNING(T t) {
        LogDAO logDAO = new LogDAO();


        Log log = new Log(logDAO.creatId(), "WARNING",LocalDateTime.now(), this.getIpAddress(), null, value, getNational());
        new LogDAO().insert(log);
        return 0;
    }


    @Override
    public int deleteAll(ArrayList<T> list) {
        return 0;
    }

    public String getIpAddress() {
        String result="";
        try {
            result= IPv4Converter.convertIPv4(new CountryIdentifier().getClientIpAddress(request));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public Gson getGson() {
        return gson;
    }

    @Override
    public int update(T t) {
        LogDAO logDAO = new LogDAO();
        Log log = new Log(logDAO.creatId(), "INFO", LocalDateTime.now() , this.getIpAddress(), preValue, value, getNational());
        new LogDAO().update(log);
        return 0;
    }
}