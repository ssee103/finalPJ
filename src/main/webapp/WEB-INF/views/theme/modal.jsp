<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Toast 알림 메시지 -->
<div class="position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1100">
	<div id="toastMessage" class="toast hide align-items-center text-white bg-primary border-0 shadow-lg" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
					<div class="toast-body" id="toastBody">
							<!-- 메시지가 여기에 표시됨 -->
					</div>
					<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
	</div>
</div>
<script>
<!-- /Toast 알림 메시지 -->
//토스트 메시지 표시 함수 (Bootstrap Toast)
function showToastMessage(message, type = "primary") {
	let toast = $("#toastMessage");
	toast.removeClass("bg-primary bg-success bg-danger bg-warning");
	toast.addClass(`bg-\${type}`);
	$("#toastBody").text(message);
	let toastInstance = new bootstrap.Toast(toast[0]);
	toastInstance.show();
}

// 호출 방법
// showToastMessage("✅ 쪽지가 전송되었습니다.", "success");
// showToastMessage("⚠️ 추가할 사원을 선택하세요.", "warning");
// showToastMessage("❌ 쪽지 전송에 실패했습니다.", "danger");
</script>
<!-- /Toast 알림 메시지 -->

<!-- Confirm 모달 -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog mt-5">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body" id="confirmMessage">
				<!-- 여기에 메시지가 들어감 -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" id="confirmCancel" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="confirmOk">확인</button>
			</div>
		</div>
	</div>
</div>
<script>
function showConfirmModal(message) {
	return new Promise((resolve) => {
		$("#confirmMessage").text(message);
		
		let modal = new bootstrap.Modal(document.getElementById("confirmModal"));
		modal.show();

		$("#confirmOk").off("click").on("click", function () {
			modal.hide();
			resolve(true); // 확인 버튼 클릭 시 true 반환
		});

		$("#confirmCancel").off("click").on("click", function () {
			modal.hide();
			resolve(false); // 취소 버튼 클릭 시 false 반환
		});
	});
}
/*
호출방법
function 나의기능(){
	showConfirmModal(출력할 메시지).then((isConfirmed) => {
		if(isConfirmed){
			확인눌렀을때 실행할 코드
		}
	});
}
*/
</script>

<!-- /Confirm 모달 -->
