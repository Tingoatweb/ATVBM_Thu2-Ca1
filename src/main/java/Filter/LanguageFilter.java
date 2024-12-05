package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LanguageFilter implements Filter{

	@Override
	public void destroy() {
		 System.out.println("LanguageFilter destroyed.");
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String language = request.getParameter("lang");
		if(language!=null) {
			request.getSession().setAttribute("language", language);
		}else {
			language="en";
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		 System.out.println("LanguageFilter initialized.");
		
	}

}
