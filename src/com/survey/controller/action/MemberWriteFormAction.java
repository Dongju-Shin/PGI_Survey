package com.survey.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberWriteFormAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      
      String url = "/member/memberwrite.jsp" ;
      
      RequestDispatcher dispatcher = request.getRequestDispatcher(url) ;
      dispatcher.forward(request, response);
      
   }
   
}