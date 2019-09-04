package arc.mirim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberAuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("sessionId") != null) {
			if(session.getAttribute("sessionId").equals("admin")){
			   session.setAttribute("message", "접근하실 수 없는 페이지입니다!");
			   System.out.println("세션이 없거나 admin 세션이라면 회원 메뉴에 접근할 수 없습니다");
		       response.sendRedirect("/");
			   return false;
		    }
		}
		
		if(session.getAttribute("sessionId") == null) {
			session.setAttribute("message", "이 페이지에 접근하시려면 로그인 해주세요!");
			System.out.println("이 페이지에 접근하시려면 로그인 해주세요!");
			response.sendRedirect("/");
		    return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
