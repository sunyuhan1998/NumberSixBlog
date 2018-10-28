package com.sunyuhan.nsBlog.func;

import java.util.ArrayList;
import java.util.List;

import com.sunyuhan.nsBlog.model.Article;
import com.sunyuhan.nsBlog.service.ArticleService;

/**
 * @author sunyuhan
 *
 * 2018年10月17日
 * 
 * 首页四个文章推荐的核心算法以及
 * 通过文章id获得摘要的算法
 */
public class Summary {
	/*调用getGoodArt()获得文章正文长度超过2000并且有图片的文章
	 * 并通过 cont2Summary()方法忽略其格式，只获得正文摘要
	*/
	public List<Article> doSummary() {
		List<Article> articles = new ArticleService().getGoodArt();
		List<Article> sumArt = new ArrayList<Article>();
		int i = 0;
		for(Article article:articles) {
			article.setContent(new Summary().cont2Summary(article.getContent()));
			sumArt.add(article);
			i++;
			if (i==4) {
				break;
			}
		}
		return sumArt;
	}
	/*
	 * 通过文章id获得摘要，主页热点调用
	 */
	public Article getSummary(int artID) {
		Article article = null;
		article = new ArticleService().getArtInfo(artID);
		article.setContent(new Summary().cont2Summary(article.getContent()));
		return article;
		
	}
	
	
	
	
	//根据isCnorEn()方法的返回值做文章内容忽略格式的合并
	private String cont2Summary(String content) {
		String summary = content;
        char[] charArray = summary.toCharArray();
        summary = "";
        for (char c : charArray) {
            int cnorEn = isCnorEn(c);
            if (cnorEn==1) {
				summary=summary+c;
				if (summary.length()>45) {//摘要45字
					break;
				}
			}
        }
        return summary;
	}
	//判断每个字符是中文还是英文
	private int isCnorEn(char c){
        if(c >= 0x0391 && c <= 0xFFE5) //中文字符
            return 1;
        if(c>=0x0000 && c<=0x00FF){ //英文字符
            return 2;
        }
        if (c>=0x0030 && c<=0x0039) {
        	return 1;
        }
        return 3;
    }
	

}
