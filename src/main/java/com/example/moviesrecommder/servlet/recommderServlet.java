package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.moviesrecommder.javabean.Movie;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "recommderServlet", value = "/recommderServlet")
public class recommderServlet extends HttpServlet {
    @Autowired
    JdbcTemplate dbdao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = (String) request.getSession().getAttribute("username");
        List<Map<String, Object>> list=dbdao.queryForList("select * from user where username=?",name);
        int id = (int) list.get(0).get("userid");
        System.out.println("当前用户id="+id);
        HttpSession session = request.getSession(true);
        session.setAttribute("userid",id);
        List<RecommendedItem> recommendations = null;
        try {
            list = dbdao.queryForList("select * from movie_preferences where userID=?",id);
            DataModel model = new FileDataModel(new File("D:/ChromeDowload/filmtrust/newratings.txt"));//构造数据模型
            ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);//计算内容相似度

            Recommender recommender = new GenericItemBasedRecommender(model, similarity);//构造推荐引擎
            if(list.size()>5)   recommendations = recommender.recommend(id, 10);//得到推荐结果
            else{
                list = dbdao.queryForList("select * from trust where uid1=? and value=(select max(value) from trust where uid1=?)",id,id);
                int nid = (int) list.get(0).get("uid2");
                recommendations = recommender.recommend(nid, 10);//得到推荐结果
            }
//            UserSimilarity similarity = new PearsonCorrelationSimilarity(model);//用PearsonCorrelation 算法计算用户相似度
//            UserNeighborhood neighborhood = new NearestNUserNeighborhood(3, similarity, model);//计算用户的“邻居”，这里将与该用户最近距离为 3 的用户设置为该用户的“邻居”。
//            Recommender recommender = new CachingRecommender(new GenericUserBasedRecommender(model, neighborhood, similarity));//采用 CachingRecommender 为 RecommendationItem 进行缓存
//            recommendations = recommender.recommend(id, 10);//得到推荐的结果，size是推荐结果的数目
            List<Movie> movieList = new ArrayList<>();
            for(RecommendedItem recommendtion:recommendations){
                //out.println(recommendtion);
                movieList.add(getmovieinfo((int)recommendtion.getItemID()));
            }
            //JSONObject result = new JSONObject();
            //result.put("movies",movieList);
            out.println(JSON.toJSONString(movieList));
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
    public  Movie getmovieinfo(int id){
        Movie movie = null;
        List<Map<String, Object>> list=dbdao.queryForList("select * from movies where id=?",id);
        String name = (String) list.get(0).get("name");
        String year = (String) list.get(0).get("published_year");
        String[] t = ((String) list.get(0).get("type")).split(",");
        List<String> type = new ArrayList<String>();
        for(String s:t) type.add(s);
        movie = new Movie(id,name,year,type);
        return movie;
    }
}
