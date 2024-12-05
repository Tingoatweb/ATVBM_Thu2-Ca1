
package util;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * 
 */
public class PasswordEncryption {
	//md5
	//sha-1
	public static String toSHA1(String text) {
		//lam cho mat khau phuc tap len
		String salt="tynskdjwakdlwdj;scawdfeedh";
		String result = null;
		text = text+ salt;
		try {
			byte[]dataBytes = text.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(dataBytes);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	public static void main(String[] args) {
		System.out.println(toSHA1("1"));
	}

}
