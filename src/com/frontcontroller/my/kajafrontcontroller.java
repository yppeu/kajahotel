package com.frontcontroller.my;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bkinfoDAO.bkInfoDAO;
import bkinfoVO.bkInfoVO;
import memberDAO.MemberDAO;
import memberVO.MemberVO;

@WebServlet("*.do")
public class kajafrontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public kajafrontcontroller() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		System.out.println(request.getRequestURI());

		System.out.println(request.getContextPath());

		String c = request.getRequestURI().substring(request.getContextPath().length());

		System.out.println(c);
		String str = null;

		switch (c) {

		case "/join.do": {
			String lastname = request.getParameter("lastname");
			String firstname = request.getParameter("firstname");
			String tel = request.getParameter("mobile2");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String passwd = request.getParameter("passwd");

			MemberDAO mdao2 = null;
			try {
				mdao2 = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO: handle exception
			}

			mdao2.insertMember(firstname, lastname, tel, email1, email2, passwd);
			str = "index.jsp";// ???????????????
			break;
		}
		case "/loginNow.do": {
			// login.jsp?????? email pwd??? ???????????? requestParameter??? ?????????
			String email = request.getParameter("inputmail");
			int idx = email.indexOf("@");
			String mail1 = email.substring(0, idx);
			String mail2 = email.substring(idx + 1, email.length()); // sql ????????? ????????? @??? ?????? ??????
			String inputpwd = request.getParameter("inputpwd");
			// email ????????? pwd??? ???????????? DAO.CheckValidLogin()

			MemberDAO mdao = null;// dao????????????
			try {
				mdao = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			System.out.println(email + "/" + idx + "/" + mail1 + "/" + mail2 + "/" + inputpwd + "/");
			// session??? ????????????
			HttpSession session = request.getSession();
			MemberVO member;
			int memnum = 0;
			String name = "";
			try {
				member = mdao.getInfo(mail1);
				memnum = member.getMemnum();
				name = member.getLastname() + member.getFirstname();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {// boolean CheckValidLogin ??? ?????????
				if (mdao.CheckValidLogin(mail1, mail2, inputpwd)) {
					// System.out.println("???????????????");

					// System.out.println(memnum);
					session.setAttribute("login", "yes");
					session.setAttribute("memnum", memnum);
					session.setAttribute("username", name);
					// response.sendRedirect("index.jsp");
					str = "index.jsp";

					/*
					 * String old_url = request.getHeader("referer"); str=old_url; RequestDispatcher
					 * rd1 = request.getRequestDispatcher(str); rd1.forward(request, response);
					 */
					// ????????? ????????? ?????? ?????????????????? ????????????
				} else {
					// response.sendRedirect("loginFail.jsp");
					str = "loginFail.jsp";
				}
			} catch (Exception e) {
				str="loginfail.jsp";
				/*
				 * PrintWriter out =response.getWriter();
				 * response.setContentType("text/html;charset=utf-8");
				 * out.println("<script languge ='javascript'>");
				 * out.println("alert('???????????? ??????????????????. ????????? ???????????? ???????????????.')"); out.flush();
				 */
				// response.sendRedirect("loginFail.jsp");
			}

			break;

		} // loginNow.do end

		// ?????? ?????? pwd?????? ???????????? pwd?????? ???????????? ??????
		// yes?????? ????????? "???????????????" sessionAttribute("loginstatus",yes");???
		// no?????? login????????? redirect, ????????? (??????????????? ?????? x or ???????????? ??????)

		case "/logOutNow.do": {
			HttpSession session = request.getSession();
			if ((session.getAttribute("login")) == "yes") {
				session.setAttribute("login", "no");
				// ????????? ???????????? ?????? ??????????????? ?????????
			}

//			String old_url = request.getHeader("referer");
//			str=old_url;
//			RequestDispatcher rd = request.getRequestDispatcher(str);
//			rd.forward(request, response);
			str = "index.jsp";
			break;
		} // logout ??????

		// ???????????? ????????????
		// sessionScope.setAttribute("loginstatus","no");
		// header??? ???????????? ??????->?????????

		case "/loginCheck.do": {
			HttpSession session = null;
			session = request.getSession();
			// null??? new??? ????????? ????????? ...null????????? ????????????????????? ????????????
			if (session.isNew()) {// ???????????? ????????? ???????????? ???????????? ????????? reset??????.
				session.setAttribute("login", "no");
			} else {
				if (session.getAttribute("login").equals("no")) {
					response.sendRedirect("login.jsp");
				}
				;
			}
			String old_url = request.getHeader("referer");
			str = old_url;
			RequestDispatcher rd = request.getRequestDispatcher(str);
			rd.forward(request, response);
			break;
		}

		// ????????????
		case "/insertRervInfo.do":
			HttpSession session = request.getSession();
			int memnum = (int) session.getAttribute("memnum");
			MemberDAO mdao = null;
			MemberVO member = null;
			try {
				mdao = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			try {
				member = mdao.getInfoMemnum(memnum);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

			// date ????????? ???????????? ??????????????? ????????? > ????????? ???????????? ??????
			String chkin = request.getParameter("checkindate");
			String chkout = request.getParameter("checkoutdate");

			String rmtype = request.getParameter("roomtype");

			String fname = member.getFirstname();// request.getParameter("firstname");
			String lname = member.getLastname();// request.getParameter("lastname");
			int headcnt = Integer.parseInt(request.getParameter("headcount"));
			String tel = member.getTel();// request.getParameter("tel");
			// int memnum=Integer.parseInt(request.getParameter("memnum"));
			System.out.println(rmtype);
			// ????????? ??????????????? >???????????????????????? ?????? ??? ?????? ????????? ??????????????? ?????? ??????
			request.setAttribute("setone", "1");

			bkInfoDAO bkdao = null;

			try {
				bkdao = new bkInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			bkdao.insertBkInfo(chkin, chkout, rmtype, tel, headcnt, fname, lname, memnum);

			request.setAttribute("memnum", memnum);
			str = "bk_chk.do";
			break;
		// ????????????
		case "/bk_chk.do":// search.do?????? ?????????????????? ????????? ??? ???????????? ???????????? ?????????. //mem_num ???????????????.

			bkInfoDAO bkdao2 = null;
			HttpSession session2 = request.getSession();
			int memnum2 = (int) session2.getAttribute("memnum");
			try {
				bkdao2 = new bkInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			// int memnum2=(int)request.getAttribute("memnum");
			ArrayList<bkInfoVO> blist = new ArrayList<bkInfoVO>();

			try {
				blist = bkdao2.getAllInfo(memnum2);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("memnum", memnum2);
			request.setAttribute("blist", blist);

			str = "bk_chk.jsp";
			break;
		// ????????????1
		case "/bkUpdate.do":
			bkInfoDAO bkdao4 = null;
			bkInfoVO bk4 = null;

			int BKNUM2 = Integer.parseInt(request.getParameter("BKNUM"));

			try {
				bkdao4 = new bkInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			try {
				bk4 = bkdao4.getInfo(BKNUM2);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			request.setAttribute("BKNUM", BKNUM2);
			request.setAttribute("bk", bk4);
			str = "bk_up.jsp";
			break;
		// ????????????2
		case "/bkUpdate2.do":
			bkInfoDAO bkdao5 = null;

			String BKNUM3 = request.getParameter("BKNUM");
			String chkin3 = request.getParameter("checkindate");
			String chkout3 = request.getParameter("checkoutdate");
			String rmtype3 = request.getParameter("roomtype");
			int headcnt3 = Integer.parseInt(request.getParameter("headcount"));
			System.out.println(BKNUM3);

			try {
				bkdao5 = new bkInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			try {
				bkdao5.updateBk(chkin3, chkout3, rmtype3, headcnt3, BKNUM3);
				System.out.println("???????????? ??????");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			request.setAttribute("BKNUM", BKNUM3);
			str = "bk_chk.do";
			break;

		// ????????????
		case "/bkDelete.do":

			bkInfoDAO bkdao3 = null;
			bkInfoVO bk3 = null;
			String BKNUM = request.getParameter("BKNUM");

			try {
				bkdao3 = new bkInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO: handle exception
			}
			bkdao3.delBk(BKNUM);
			request.setAttribute("BKNUM", BKNUM);
			str = "bk_chk.do";
			break;
		}

		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}