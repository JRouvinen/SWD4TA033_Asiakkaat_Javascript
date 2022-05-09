package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

/**
 * Servlet implementation class HaeAsiakkaat
 */
@WebServlet("/haeasiakkaat")
public class HaeAsiakkaat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HaeAsiakkaat() {
        super();
        System.out.println("HaeAsiakkaat.HaeAsiakkaat()");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HaeAsiakkaat.doGet()");
		String searchword = request.getParameter("searchwrd");
		System.out.println("HaeAsiakkaat srv:"+searchword);
		Dao dao = new Dao();
		ArrayList<Asiakas> asiakkaat = null;
		try {
			if (searchword == null) {
				searchword = "";}
			asiakkaat = dao.listAll(searchword);
			System.out.println(asiakkaat);			
			request.setAttribute("asiakkaat", asiakkaat);			
			String jsp = "/listaaasiakkaat.jsp"; 
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
			dispatcher.forward(request, response);			   
		} catch (Exception e) {				
			e.printStackTrace();
		}					
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HaeAsiakkaat.doPost()");
	}
}
