/**
 *
 */
package util;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;





/**
 *
 */
public class Email {
	//su dung TLS de dang nhap vao email
	//smtp: simple mail transfer protocol= giao thuc truyen tai don gian hoa
	//ssl: bao mat
	//email: 21130574@st.hcmuaf.edu.vn
	//password: objd edul gnes zspk

	static String from="21130565@st.hcmuaf.edu.vn";
    static String password="ngxm uwty mgkv lbwt";

	public static void sendEmail(String to, String noiDung, String subject) {

		//properties: khai bao thuoc tinh
		Properties props = new Properties();
		//su dung server de gui mail
		props.put("mail.smtp.host", "smtp.gmail.com");//SMTP HOST
		//
		props.put("mail.smtp.port", "smtp.gmail.com");//TLS 587 SSL 465
		//khi su dung host de gui mail thi phai dang nhap
		props.put("mail.smtp.auth", "true");
		//
		props.put("mail.smtp.starttls.enable", "true");
		//create authenticator
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		};

		//phien lam viec: dang nhap vao gmail voi tai khoan auth
		Session session = Session.getInstance(props, auth);
		//gui email
		//final String to="trangthuyjungkook@gmail.com";
		//tao mot tin nhan
		MimeMessage msg = new MimeMessage(session);

		try {
			//kieu noi dung
			msg.addHeader("Content-type", "test/HTML; charset=UTF-8");

			//nguoi gui
			msg.setFrom(from);

			//tao ra dia chi de nhan email
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

			//tieu de
			msg.setSubject(subject);

			//quy dinh ngay gui
			msg.setSentDate(new Date());

			//quy dinh email nhan phan hoi
			//msg.setReplyTo(null)

			//noi dung


			msg.setContent(
					"<!DOCTYPE html>\r\n"
							+ "<html>\r\n"
							+ "<head>\r\n"
							+ "<meta charset=\"UTF-8\">\r\n"
							+ "<title>Insert title here</title>\r\n"
							+ "</head>\r\n"
							+ "<body>\r\n"
							+ "<h1>My First Heading</h1>\r\n"
							+ "<p>"+noiDung+"</p>\r\n"
							+"<img src=\"https://i.pinimg.com/564x/44/5f/52/445f522692dfd26142559260b61daf69.jpg\" alt=\"\" width=\"70\" height=\"70\" >"
							+ "</body>\r\n"
							+ "</html>", "text/html");

			//gui email
			Transport.send(msg);
			System.out.println("gui email thanh cong");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("gap loi trong qua trinh gui email");
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {


	}

}
