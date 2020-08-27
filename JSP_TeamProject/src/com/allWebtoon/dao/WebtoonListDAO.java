package com.allWebtoon.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.allWebtoon.db.JdbcSelectInterface;
import com.allWebtoon.db.JdbcTemplate;
import com.allWebtoon.vo.SearchWebtoonVO;
import com.allWebtoon.vo.WebtoonVO;

public class WebtoonListDAO {
	public static ArrayList<WebtoonVO> selRandomWebtoonList(ArrayList<WebtoonVO> list, int platformNum, int randomLength){
		String sql = " select w_no, w_title, w_story, w_thumbnail, w_link, w_platform "
					+ " from t_webtoon "
					+ " where w_platform = ? "
					+ " order by rand() limit ? ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			@Override
			//물음표 넣을 때
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setInt(1, platformNum);
				ps.setInt(2, randomLength);
			}
			@Override
			//while문으로 값 가져올 때
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					WebtoonVO vo = new WebtoonVO();
					vo.setW_no(rs.getInt("w_no"));
					vo.setW_title(rs.getNString("w_title"));
					vo.setW_story(rs.getNString("w_story"));
					vo.setW_thumbnail(rs.getNString("w_thumbnail"));
					vo.setW_platform(rs.getInt("w_platform"));
					list.add(vo);
				}
				return 1;
			}
		});
		
		return list;
	}
	public static ArrayList<SearchWebtoonVO> selSearchList(SearchWebtoonVO vo, int randomLength){
		ArrayList<SearchWebtoonVO> list = new ArrayList<SearchWebtoonVO>();
		String sql = " SELECT w_no, w_title, w_story, w_thumbnail, w_platform "
				+ " FROM t_webtoon "
				+ " WHERE w_title "
				+ " LIKE ? "
				+ " ORDER BY RAND() LIMIT ? ";
		
		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setNString(1, "%"+vo.getSearchKeyword()+"%");
				ps.setInt(2, randomLength);
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					SearchWebtoonVO param = new SearchWebtoonVO();
					param.setW_no(rs.getInt("w_no"));
					param.setW_title(rs.getNString("w_title"));
					param.setW_story(rs.getNString("w_story"));
					param.setW_thumbnail(rs.getNString("w_thumbnail"));
					param.setW_platform(rs.getInt("w_platform"));
					list.add(param);
				}
				return 1;
			}
		});
		return list;
	}
	
}
