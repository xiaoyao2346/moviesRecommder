package com.example.moviesrecommder;

import java.io.*;
import java.util.List;

import org.apache.mahout.cf.taste.impl.common.FastByIDMap;
import org.apache.mahout.cf.taste.impl.model.GenericDataModel;
import org.apache.mahout.cf.taste.impl.model.GenericUserPreferenceArray;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.slopeone.SlopeOneRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.PreferenceArray;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

public class RecommenderIntro {
	public static void main(String[] args) throws Exception {
//		BufferedReader br = null;
//		BufferedWriter out = new BufferedWriter(new FileWriter("D:/ChromeDowload/filmtrust/newtrust.txt"));
//		try {
//			br = new BufferedReader(new FileReader("D:/ChromeDowload/filmtrust/trust.txt"));    // 读取文件
//
//			String line = null;
//			while((line = br.readLine()) != null) {    // 按行读取
//
//				String str = line.replace(" ",",");
//				System.out.println(str);
//				out.write(str+"\n");
//			}
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		FileWriter fw;
//		try {
//			fw = new FileWriter("D:/ChromeDowload/filmtrust/newratings.txt", true); //就是这个构造方法的第二个参数，为true则是追加内容
//			BufferedWriter bw = new BufferedWriter(fw);
//			bw.write("\nhello");
//			bw.write("\nworld");
//			bw.close();
//			fw.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		List<RecommendedItem> recommendations = null;
		try {
			DataModel model = new FileDataModel(new File("D:/ChromeDowload/filmtrust/newratings.txt"));//构造数据模型
			Recommender recommender = new CachingRecommender(new SlopeOneRecommender(model));//构造推荐引擎
			recommendations = recommender.recommend(1508, 3);//得到推荐的结果，size是推荐接过的数目
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		for (RecommendedItem recommendation : recommendations) {
			System.out.println(recommendation);
		}

	}
}
