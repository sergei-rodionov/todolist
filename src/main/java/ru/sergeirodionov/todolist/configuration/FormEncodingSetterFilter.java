package ru.sergeirodionov.todolist.configuration;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by SergeiRodionov.ru on 11.08.2015.
 */


// FILTER FOR FORM POST TO UTF-8 convert
public class FormEncodingSetterFilter implements Filter {

    private static final String FILTERABLE_CONTENT_TYPE = "application/x-www-form-urlencoded";

    private static final String ENCODING_DEFAULT = "UTF-8";

    private static final String ENCODING_INIT_PARAM_NAME = "encoding";

    private String encoding;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws ServletException, IOException {
        String contentType = req.getContentType();
        if (contentType != null && contentType.startsWith(FILTERABLE_CONTENT_TYPE))
            req.setCharacterEncoding(encoding);

        // off cache
        HttpServletResponse httpResponse = (HttpServletResponse) resp;
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpResponse.setHeader("Pragma", "no-cache");
        httpResponse.setDateHeader("Expires", 0);

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter(ENCODING_INIT_PARAM_NAME);
        if (encoding == null)
            encoding = ENCODING_DEFAULT;
    }
}