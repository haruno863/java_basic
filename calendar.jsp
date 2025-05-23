<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.ZoneId"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setLocale value="ja_JP" />
<%!private static Map eventMap = new HashMap();
	static {
		eventMap.put("20250101", "お正月");
		eventMap.put("20250113", "成人の日");
		eventMap.put("20250211", "建国記念の日");
		eventMap.put("20250223", "天皇誕生日");
		eventMap.put("20250320", "春分の日");
		eventMap.put("20250429", "昭和の日");
		eventMap.put("20250503", "憲法記念日");
		eventMap.put("20250504", "みどりの日");
		eventMap.put("20250505", "こどもの日");
		eventMap.put("20250721", "海の日");
		eventMap.put("20250811", "山の日");
		eventMap.put("20250915", "敬老の日");
		eventMap.put("20250923", "秋分の日");
		eventMap.put("20251013", "スポーツの日");
		eventMap.put("20251103", "文化の日");
		eventMap.put("20251123", "勤労感謝の日");
		eventMap.put("20251223", "天皇誕生日");
		eventMap.put("20251225", "クリスマス");
		eventMap.put("20251231", "大晦日");
	}%>
<%
// リクエストのパラメーターから日付を取り出す
String year = (String) request.getParameter("year");
String month = (String) request.getParameter("month");
String day = (String) request.getParameter("day");
LocalDate localDate = null;
if (year == null || month == null || day == null) {
	// 日付が送信されていないので、現在時刻を元に日付の設定を行う
	localDate = LocalDate.now();
	year = String.valueOf(localDate.getYear());
	month = String.valueOf(localDate.getMonthValue());
	day = String.valueOf(localDate.getDayOfMonth());
} else {
	// 送信された日付を元に、LocalDateのインスタンスを生成する
	localDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
}
String[] dates = { year, month, day };

// 画面で利用するための日付、イベント情報を保存
request.setAttribute("dates", dates);
request.setAttribute("date", Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));

String event = (String) eventMap.get(year + month + day);
request.setAttribute("event", event);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style>
ul {
	list-style: none;
}
</style>
</head>
<body>
	<form method="GET" action="/jsp/calendar.jsp">
		<ul>
			<li><input type="text" name="year" value="${dates[0]}" /><label
				for="year">年</label><input type="text" name="month"
				value="${dates[1]}" /><label for="month">月</label><input
				type="text" name="day" value="${dates[2]}" /><label
				for="day">日</label></li>
			<li><input type="submit" value="送信" />
			<li><c:out value="${fn:join(dates, '/')}" /> (<fmt:formatDate
					value="${date}" pattern="E" />)</li>
			<li><c:out value="${event}" /></li>
		</ul>
	</form>
</body>
</html>
