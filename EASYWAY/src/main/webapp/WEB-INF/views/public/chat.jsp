<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- partial:index.partial.html -->
<button class="chatbox-open">
	<i class="fa fa-comment fa-2x" aria-hidden="true"></i>
</button>
<button class="chatbox-close">
	<i class="far fa-times-circle fa-2x" aria-hidden="true"></i>
</button>
<section class="chatbox-popup">
	<header class="chatbox-popup__header">
		<aside style="flex: 3">
			<i class="fa fa-user-circle fa-4x chatbox-popup__avatar"
				aria-hidden="true"></i>
		</aside>
		<aside style="flex: 8">
			<h1>${sessionScope.nowEmployeeInfo.employeeDepartment}부 채팅방</h1>
			${sessionScope.nowEmployeeInfo.employeeName} (Online)
		</aside>
		<aside style="flex: 1">
			<button class="chatbox-maximize">
				<i class="fa fa-window-maximize" aria-hidden="true"></i>
			</button>
		</aside>
	</header>
	<main id="small-content-message" class="chatbox-popup__main">
	</main>
	<footer class="chatbox-popup__footer">
		<aside style="flex: 10">
			<textarea class="text-message1" type="text" placeholder="채팅 내용을 입력해주세요..."
				autofocus></textarea>
		</aside>
		<aside class="send-message1" style="flex: 1; color: #888; text-align: center;">
			<i class="fa fa-paper-plane" aria-hidden="true"></i>
		</aside>
	</footer>
</section>
<section class="chatbox-panel">
	<header class="chatbox-panel__header">
		<aside style="flex: 3">
			<i class="fa fa-user-circle fa-3x chatbox-popup__avatar"
				aria-hidden="true"></i>
		</aside>
		<aside style="flex: 6">
			<h1>${sessionScope.nowEmployeeInfo.employeeDepartment} 채팅방</h1>
			${sessionScope.nowEmployeeInfo.employeeName} (Online)
		</aside>
		<aside style="flex: 3; text-align: right;">
			<button class="chatbox-minimize">
				<i class="fa fa-window-restore" aria-hidden="true"></i>
			</button>
			<button class="chatbox-panel-close">
				<i class="far fa-times-circle" aria-hidden="true"></i>
			</button>
		</aside>
	</header>
	<main id="lage-content-message" class="chatbox-panel__main" style="flex:1">
	
	</main>
	<footer class="chatbox-panel__footer">
		<aside style="flex: 10">
			<textarea class="text-message2" type="text" placeholder="채팅 내용을 입력해주세요..."
				autofocus></textarea>
		</aside>
		<aside class="send-message2" style="flex: 1; color: #888; text-align: center;">
			<i class="fa fa-paper-plane" aria-hidden="true"></i>
		</aside>
	</footer>
</section>
<input type="hidden" name="departmentId" value="${nowEmployeeInfo.departmentId}">
<input type="hidden" name="employeeId" value="${nowEmployeeInfo.employeeId}">
<input type="hidden" name="employeeName" value="${nowEmployeeInfo.employeeName}">
<!-- partial -->

