package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

/**
 * Servlet implementation class LisaaAsiakas
 */
@WebServlet("/lisaaasiakas")
public class LisaaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LisaaAsiakas() {
        super();
        System.out.println("LisaaAsiakas.LisaaAsiakas()");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doGet()");		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setAsiakasnro(request.getParameter("asiakasid"));
		asiakas.setEtunimi(request.getParameter("etun"));
		asiakas.setSukunimi(request.getParameter("sukun"));
		asiakas.setPuhelin(request.getParameter("puh"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.lisaaAsiakas(asiakas);
		response.sendRedirect("haeasiakkaat?searchwrd=" + asiakas.getAsiakasnro());
	}
}
