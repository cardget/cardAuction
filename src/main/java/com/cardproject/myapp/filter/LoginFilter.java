package com.cardproject.myapp.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
	
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 초기화 작업이 필요하다면 여기서 수행
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        boolean loggedIn = (httpRequest.getSession(false) != null && httpRequest.getSession(false).getAttribute("userid") != null);

        if (!loggedIn) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/auth/login"); // 로그인 페이지로 리다이렉트
            return;
        }

        chain.doFilter(request, response); // 다음 필터나 서블릿으로 요청 전달
    }

    @Override
    public void destroy() {
        // 필터가 제거될 때 처리할 작업이 필요하다면 여기서 수행
    }
}
