package util;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class IPv4Converter {

    //nhận vào một chuỗi địa chỉ IPv6 và trả về chuỗi địa chỉ IPv4
    public static String IPv6ToIPv4(String ipAddress) {
        try {
            InetAddress inet6Address = InetAddress.getByName(ipAddress);
            if (inet6Address instanceof Inet6Address) {
                Inet6Address inet6 = (Inet6Address) inet6Address;
                byte[] ipv4Bytes = new byte[4];
                System.arraycopy(inet6.getAddress(), 12, ipv4Bytes, 0, 4);
                InetAddress inet4Address = InetAddress.getByAddress(ipv4Bytes);
                return inet4Address.getHostAddress();
            }
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return null;
    }
    //trả về địa chỉ IPv4 mới sau khi đã thực hiện các biến đổi bit.
    public static String convertIPv4(String ipAddress) {
        ipAddress = IPv6ToIPv4(ipAddress);
        String[] octets = ipAddress.split("\\.");

        if (octets.length != 4) {
            throw new IllegalArgumentException("Invalid IPv4 address format");
        }

        // Parse octets
        int octet1 = Integer.parseInt(octets[0]);
        int octet2 = Integer.parseInt(octets[1]);
        int octet3 = Integer.parseInt(octets[2]);
        int octet4 = Integer.parseInt(octets[3]);

        // Perform bitwise operations to transform the IP address
        int convertedOctet1 = octet1 | 0b10000000; // Set the first bit to 1
        int convertedOctet2 = octet2;
        int convertedOctet3 = octet3;
        int convertedOctet4 = octet4;

        // Construct the converted IP address string
        String convertedIpAddress = String.format("%d.%d.%d.%d",
                convertedOctet1, convertedOctet2,
                convertedOctet3, convertedOctet4);

        return convertedIpAddress;
    }
}
