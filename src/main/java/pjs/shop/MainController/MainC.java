package pjs.shop.MainController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pjs.shop.music.MusicDAO;
import pjs.shop.music.MusicVo;

import pjs.shop.user.UserDAO;
import pjs.shop.user.UserVO;

@Controller
public class MainC {
    UserDAO us =UserDAO.getIntance();    
    MusicDAO ms =MusicDAO.getInstance();
    @RequestMapping(value = "/")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/play.do")
    public String play(){
        
        return "play";
    }
 

    @RequestMapping(value = "/main.do")
    public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ArrayList<MusicVo> voa =ms.selectList(request, response);
        request.setAttribute("voa", voa);
        RequestDispatcher rd =request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
        rd.forward(request, response);

    }


    @RequestMapping(value = "/cart.do")
    public void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        ArrayList<MusicVo> voa =ms.selectCart(id);
        request.setAttribute("voa", voa);
        RequestDispatcher rd =request.getRequestDispatcher("WEB-INF/jsp/cart.jsp");
        rd.forward(request, response);
        
    }

    @RequestMapping(value = "/search.do")
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("serchinput");
        ArrayList<MusicVo>  votitle =ms.selectTitle(search);
        ArrayList<MusicVo>  vosinger =ms.selectSinger(search);
        request.setAttribute("votitle", votitle);
 
        request.setAttribute("vosinger", vosinger);
        RequestDispatcher rd =request.getRequestDispatcher("WEB-INF/jsp/search.jsp");
        rd.forward(request, response);
    }

//????????? ????????????
    @RequestMapping(value = "/listener.do")
    public void listener(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        if(id != null && !id.equals("")){
            UserVO vo =us.selectUser(id);
            ArrayList<MusicVo> voa =ms.selectPurchased(request, response);
            ArrayList<MusicVo> artist =ms.artist(ms.recoArticstName(id));

            request.setAttribute("artist", artist);
            session.setAttribute("auth", vo.getAuth());
            request.setAttribute("vo", vo);
            request.setAttribute("voa", voa);
            RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/listener.jsp");
            rd.forward(request, response);
            return;
        }else{
            session.setAttribute("message", "???????????? ????????? ????????? ?????????.");
            PrintWriter out=response.getWriter();
            String script="";
            script = "<script language='javascript'>";
            script += "loignpopup();";
            script += "</script>";
         
            out.println(script);
            response.sendRedirect("main.do");
            return;
        }
    }
 
    @RequestMapping(value = "/history.do")
    public void history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        if(id != null && !id.equals("")){
            UserVO vo =us.selectUser(id);
            ArrayList<MusicVo> voa =ms.selectPurchased(request, response);
            ArrayList<MusicVo> artist =ms.artist(ms.recoArticstName(id));

            request.setAttribute("artist", artist);
            session.setAttribute("auth", vo.getAuth());
            request.setAttribute("vo", vo);
            request.setAttribute("voa", voa);
            RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/history.jsp");
            rd.forward(request, response);
            return;
        }else{
            session.setAttribute("message", "???????????? ????????? ????????? ?????????.");
            PrintWriter out=response.getWriter();
            String script="";
            script = "<script language='javascript'>";
            script += "loignpopup();";
            script += "</script>";
         
            out.println(script);
            response.sendRedirect("main.do");
            return;
        }
    }
 

//???????????? ????????? - ????????? ?????? ??????
    @RequestMapping(value = "/publisher.do")
    public void publisher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        String auth =(String)session.getAttribute("auth");
        String id =(String) session.getAttribute("id");
        if(id!=null && !id.equals("")){
        // System.out.print(auth);
            if(auth.equals("y")){
                UserVO vo =us.selectUser(id);
                request.setAttribute("vo", vo);
                ArrayList<MusicVo> voa =ms.selectMyList(request, response);
                request.setAttribute("voa", voa);
            RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/jsp/publisher.jsp");
                rd.forward(request, response);
                return;
            }else if(auth.equals("n")){
                session.setAttribute("message", "????????? ????????? ????????? ????????? ?????????.");
                response.sendRedirect("emailauth.do");
                return;
            }
        }else{
            session.setAttribute("message", "???????????? ????????? ????????? ?????????.");
            response.sendRedirect("main.do");
            return;
        }
    }

    
//???????????? ????????? ????????????
    @RequestMapping(value = "/emailauth.do")
    public String emailauth(){
        return "emailauth";
    }

//???????????? ?????????
    @RequestMapping(value = "/mailsended.do")
    public String mailsended(){
        return "mailsended";
    }

//???????????? ??????
    @RequestMapping(value = "/registcredit.do")
    public void registcredit(HttpServletRequest request, HttpServletResponse response) throws IOException{
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        String cardnum =request.getParameter("cardnum1")+" - "+request.getParameter("cardnum2") + " - "+ request.getParameter("cardnum3");
        us.registcredit(id,cardnum);
    }
    
//????????????
    @RequestMapping(value = "/purchase.do")
    public void purchase(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        String[] chkbox =request.getParameterValues("cb1");
        HttpSession session =request.getSession();
        if(chkbox.length>0){
            ArrayList<Integer> cb =new ArrayList<Integer>();
            for(int i =0; i<chkbox.length; i++){
                cb.add(Integer.parseInt(chkbox[i])); 
            }
            String id =(String)session.getAttribute("id");
            ms.allPurchase(id, cb);
            ms.deletCart(id, cb);
            session.setAttribute("message", "????????? ?????????????????????.");
            response.sendRedirect("main.do");
        }else{
            session.setAttribute("message", "????????? ????????? ????????????.");
            response.sendRedirect("main.do");
        }
    }


//???????????? ??????   
    @RequestMapping(value = "/registcart.do")
    public void registcart(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        int s_num =Integer.parseInt(request.getParameter("s_num"));
        // System.out.println(s_num);
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        ArrayList<MusicVo> psa =ms.selectPurchased(request, response); // ???????????? ??????
        ArrayList<MusicVo> msa =ms.selectCart(id);                     // ?????? ???????????? ??????
        ArrayList<MusicVo> pma =ms.selectMyList(request, response);                     // ????????? ????????? ??? ??? ??????
        int status =0;
        if(pma.size()>0){  
            for(int k=0; k<pma.size(); k++){
                if(pma.get(k).getS_num()==s_num){
                  status=1;        //????????? ???????????? ???            
                }
            }
        }
        if(psa.size()>0){
            for(int i=0; i<psa.size(); i++){
                if(psa.get(i).getS_num() == s_num){
                    status=2;      // ?????? ????????? ???
                }
            }
        }
        if(msa.size()>0){
            for(int j=0; j<msa.size(); j++){
                if(msa.get(j).getS_num() == s_num){
                    status=3;    //  ?????? ????????????              
                }
            }
        }
        if(status==0){  
            status=0;            
            ms.insertCart(id, s_num );
        }
        PrintWriter out = response.getWriter();
        
        out.println(status);
    }
    

//???????????? ??????
    @RequestMapping(value = "/deletecart.do")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        String[] chkbox =request.getParameterValues("cb1");
        ArrayList<Integer> cb =new ArrayList<Integer>();
        for(int i =0; i<chkbox.length; i++){
            cb.add(Integer.parseInt(chkbox[i])); 
        }
        HttpSession session =request.getSession();
        String id =(String)session.getAttribute("id");
        ms.deletCart(id, cb);
        response.sendRedirect("/cart.do");
    }
    
    //?????? ????????? ????????????
    @RequestMapping(value = "/getSaveName.do")
    public void getSaveName(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("UTF-8");
        int s_num =Integer.parseInt(request.getParameter("s_num"));
        String save_name =ms.getSaveName(s_num);
        PrintWriter out =response.getWriter();
        out.println(save_name);
    }
    //???????????? ??????
    @RequestMapping(value = "/getArtist.do")
    public void getArtist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        ArrayList<MusicVo> voa =ms.artist(ms.recoArticstName(id));
        request.setAttribute("artist", voa);
        RequestDispatcher rd =request.getRequestDispatcher("WEB-INF/jsp/listener.jsp");
        rd.forward(request, response);
    }
    

    @RequestMapping(value = "/addlist.do")
    public String addlist(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        String listname =request.getParameter("addplaylist");
        HttpSession session =request.getSession();
        String id =(String) session.getAttribute("id");
        ms.addList(id, listname);
        return "play";
    }

}

