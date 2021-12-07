package org.easyway.domain.office;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WidgetGetMainDTO {

	private int wsCustom; // 불러올 위젯 커스텀 위치
	private List<WidgetVO> widgetList; // 불러올 위젯 목록
	
}
