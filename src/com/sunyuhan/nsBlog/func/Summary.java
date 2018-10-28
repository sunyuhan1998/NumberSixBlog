package com.sunyuhan.nsBlog.func;

import java.util.ArrayList;
import java.util.List;

import com.sunyuhan.nsBlog.model.Article;
import com.sunyuhan.nsBlog.service.ArticleService;

/**
 * @author sunyuhan
 *
 * 2018��10��17��
 * 
 * ��ҳ�ĸ������Ƽ��ĺ����㷨�Լ�
 * ͨ������id���ժҪ���㷨
 */
public class Summary {
	/*����getGoodArt()����������ĳ��ȳ���2000������ͼƬ������
	 * ��ͨ�� cont2Summary()�����������ʽ��ֻ�������ժҪ
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
	 * ͨ������id���ժҪ����ҳ�ȵ����
	 */
	public Article getSummary(int artID) {
		Article article = null;
		article = new ArticleService().getArtInfo(artID);
		article.setContent(new Summary().cont2Summary(article.getContent()));
		return article;
		
	}
	
	
	
	
	//����isCnorEn()�����ķ���ֵ���������ݺ��Ը�ʽ�ĺϲ�
	private String cont2Summary(String content) {
		String summary = content;
        char[] charArray = summary.toCharArray();
        summary = "";
        for (char c : charArray) {
            int cnorEn = isCnorEn(c);
            if (cnorEn==1) {
				summary=summary+c;
				if (summary.length()>45) {//ժҪ45��
					break;
				}
			}
        }
        return summary;
	}
	//�ж�ÿ���ַ������Ļ���Ӣ��
	private int isCnorEn(char c){
        if(c >= 0x0391 && c <= 0xFFE5) //�����ַ�
            return 1;
        if(c>=0x0000 && c<=0x00FF){ //Ӣ���ַ�
            return 2;
        }
        if (c>=0x0030 && c<=0x0039) {
        	return 1;
        }
        return 3;
    }
	

}
