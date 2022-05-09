package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

/**
 * Servlet implementation class MuutaAsiakas
 */
@WebServlet("/muutaasiakas")
public class MuutaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MuutaAsiakas() {
        super();
        System.out.println("MuutaAsiakas.MuutaAsiakas()");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaAsiakas.doGet()");
		String asiakasid = request.getParameter("asiakasid");
		System.out.println("MuutaAsiakas id:"+asiakasid);
		Dao dao = new Dao();
		Asiakas asiakas = dao.etsiAsiakas(asiakasid);
		request.setAttribute("asiakas", asiakas);			
		String jsp = "/muutaasiakas.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setAsiakasnro(request.getParameter("asiakasid"));
		asiakas.setEtunimi(request.getParameter("etun"));
		asiakas.setSukunimi(request.getParameter("sukun"));
		asiakas.setPuhelin(request.getParameter("puh"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.muutaAsiakas(asiakas, request.getParameter("vanhaasiakasid"));
		response.sendRedirect("haeasiakkaat?searchwrd=" + asiakas.getAsiakasnro());
	}

}
