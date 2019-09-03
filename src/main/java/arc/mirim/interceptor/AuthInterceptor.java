package arc.mirim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null") ) {
			query = "";
		} else {
			query = "?"+query;
		}
		if(request.getMethod().equals("GET")) {
			System.out.println("dest : " + (uri + query));
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		    throws Exception {

			HttpSession session = request.getSession();
			if(request.getSession().getAttribute("sessionId") == null){
			   response.sendRedirect("/");
			   return false;
		    } else {
		    	
		    }
		  
		   return super.preHandle(request, response, handler);
		}

	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView)
			throws Exception {
		HttpSession session = request.getSession();
		Object memberVO = modelAndView.getModelMap().get("MemberVO");
		if(memberVO != null) {
			System.out.println("New login success");
			session.setAttribute("login", memberVO);
			response.sendRedirect("/");
		}
	}
	
}
