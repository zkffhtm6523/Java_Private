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
	// 홈화면 출력 
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
	// 검색 결과
	public static ArrayList<SearchWebtoonVO> selSearchList(SearchWebtoonVO vo, int randomLength){
		ArrayList<SearchWebtoonVO> list = new ArrayList<SearchWebtoonVO>();
		String sql = " SELECT distinct A.w_no, w_title, concat(left(w_story, 200), '...') as w_story, w_thumbnail, D.w_genre, E.w_writer "
				 + " FROM t_webtoon A "
				 + " left join t_w_genre B "
				 + " on A.w_no = B.w_no " 
				 + " left join t_w_writer C "
				 + " on A.w_no = C.w_no " 
				 + " left join (select w_no, group_concat(distinct w_genre separator ', ') as w_genre from t_w_genre group by w_no) D "
				 + " on A.w_no = D.w_no "
				 + " left join (select w_no, group_concat(distinct w_writer separator ', ') as w_writer from t_w_writer group by w_no) E "
				 + " on A.w_no = E.w_no "
				 + " where A.w_title like ? or B.w_genre like ? or C.w_writer like ? "
				 + " order by rand() limit ? ";

		JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {
			@Override
			public void prepared(PreparedStatement ps) throws SQLException {
				ps.setNString(1, "%"+vo.getSearchKeyword()+"%");
				ps.setNString(2, "%"+vo.getSearchKeyword()+"%");
				ps.setNString(3, "%"+vo.getSearchKeyword()+"%");
				ps.setInt(4, randomLength);
			}
			
			@Override
			public int executeQuery(ResultSet rs) throws SQLException {
				while(rs.next()) {
					SearchWebtoonVO param = new SearchWebtoonVO();
					param.setW_no(rs.getInt("w_no"));
					param.setW_title(rs.getNString("w_title"));
					param.setW_story(rs.getNString("w_story"));
					param.setW_thumbnail(rs.getNString("w_thumbnail"));
					param.setW_genre(rs.getNString("w_genre"));
					param.setW_writer(rs.getNString("w_writer"));
					list.add(param);
				}
				return 1;
			}
		});
		return list;
	}
	// 웹툰 디테일
		public static WebtoonVO webtoonDetail(int w_no) {
			WebtoonVO vo = new WebtoonVO();
			String sql = " SELECT w_thumbnail, w_title, concat(left(w_story, 300),'…') as w_story, w_platform "
					+ " FROM t_webtoon "
					+ " WHERE w_no = ? ";

			JdbcTemplate.executeQuery(sql, new JdbcSelectInterface() {

				@Override
				public void prepared(PreparedStatement ps) throws SQLException {
					ps.setInt(1, w_no);
				}

				@Override
				public int executeQuery(ResultSet rs) throws SQLException {
					if(rs.next()) {
						vo.setW_thumbnail(rs.getNString("w_thumbnail"));
						vo.setW_title(rs.getNString("w_title"));
						vo.setW_story(rs.getNString("w_story"));
						vo.setW_platform(rs.getInt("w_platform"));
					}
					return 1;
				}
			});
			return vo;
		}
	
}