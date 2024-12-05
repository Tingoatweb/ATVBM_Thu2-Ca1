package util;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatCurrency {
	 public static String formatCurrency(double number) {
	        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
	        return currencyFormatter.format(number);
	    }
}
