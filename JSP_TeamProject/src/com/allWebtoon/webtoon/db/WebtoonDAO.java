package com.allWebtoon.webtoon.db;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.allWebtoon.webtoon.webVO.WebtoonVO;

public class WebtoonDAO {
	public static int insWebtoonList(WebtoonVO param) {
		String sql = " insert into t_webtoon "
				+ " (w_platform, w_title, w_genre, w_storywriter, w_artist, w_story, w_thumbnail, w_link) "
				+ " values "
				+ " (?, ?, ?, ?, ?, ?, ?, ?) ";
		return JdbcTemplate.executeUpdate(sql, new JdbcUpdateInterface() {
			
			@Override
			public void update(PreparedStatement ps) throws SQLException {
				ps.setInt(1, param.getPlatform());
				ps.setNString(2, param.getTitle());
				ps.setNString(3, param.getGenre());
				ps.setNString(4, param.getWri_story());
				ps.setNString(5, param.getWri_drawing());
				ps.setNString(6, param.getStory());
				ps.setNString(7, param.getThumbnail());
				ps.setNString(8, param.getLink());
				System.out.println("값 넣기 성공");
			}
		});
	}
}
