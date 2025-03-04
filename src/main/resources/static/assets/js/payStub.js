  let table_tbody = $("#table-tbody");
  let searchBtn = $("#searchBtn");
  let pagingArea = $("#pagingArea");
  let deptCode = $("#deptCode");
  let emplPosition = $("#emplPosition");
  
  $(function(){

    // 📌 명세서 보기 버튼 클릭 시 모달 팝업 및 데이터 로딩
  $(document).on("click", ".btn-view-stub", function () {
    const emplNo = $(this).data("empl-no");
    const emplNm = $(this).data("empl-nm");
    const deptName = $(this).data("dept-name");
    const emplPosition = $(this).data("empl-position");

    $.ajax({
      url: `/hrms/payStub/view/${emplNo}`,
      type: "post",
      success: function (data) {

        const safeValue = (value) => value !== null && value !== undefined ? value.toLocaleString() : "0";

        $("#modalEmpName").text(emplNm || "-");
        $("#modalDeptName").text(deptName || "-");
        $("#modalPosition").text(emplPosition || "-");
        $("#modalBasicSalary").text(safeValue(data.BASIC_SALARY) + " 원");
        $("#modalOvertimePay").text(safeValue(data.OVERTIME_PAY) + " 원");
        $("#modalMealPay").text(safeValue(data.MEAL_PAY) + " 원");
        $("#modalBonus").text(safeValue(data.PS_BONUS) + " 원");
        $("#modalIncomeTax").text(safeValue(data.INCOME_TAX) + " 원");
        $("#modalLocalTax").text(safeValue(data.LOCAL_TAX) + " 원");
        $("#modalEmploymentInsurance").text(safeValue(data.EMPLOYMENT_INSURANCE) + " 원");
        $("#modalHealthInsurance").text(safeValue(data.HEALTH_INSURANCE) + " 원");
        $("#modalNursingInsurance").text(safeValue(data.NURSING_INSURANCE) + " 원");
        $("#modalNationalPension").text(safeValue(data.NATIONAL_PENSION) + " 원");
        $("#modalTotalPayment").text(safeValue(data.TOTAL_PAYMENT) + " 원");
        $("#modalActualSalary").text(safeValue(data.ACTUAL_SALARY) + " 원");
        $("#modalPayDate").text(data.PAYDATE || "-");

       // ✅ 지급 상태 및 30일 조건에 따라 버튼 상태 처리
       if (data.PAY_AT === 'Y') {
        if (data.PAY_ELIGIBLE === 'Y') {
            $("#confirmPay").show().prop("disabled", false);  // 30일 경과 후 활성화
        } else {
            $("#confirmPay").show().prop("disabled", true);   // 30일 미경과 시 비활성화
            showToastMessage("⚠️ 지급 확정은 마지막 지급일로부터 30일 후에 가능합니다.", "warning");
        }
      } else {
          $("#confirmPay").show().prop("disabled", false);  // 미리보기 상태면 활성화
          $("#confirmPay").data({ emplNo: emplNo });
      }

        const payStubModal = new bootstrap.Modal(document.getElementById('payStubModal'));
        payStubModal.show();
      },
      error: function () {
        showToastMessage("❌ 급여명세서를 불러오지 못했습니다.", "danger");
      }
    });
  });

    
  // 📌 닫기 버튼
  $(document).on("click", "#closeModal", function () {
    const payStubModal = bootstrap.Modal.getInstance(document.getElementById('payStubModal'));
    payStubModal.hide();
  });
  
    // 💳 지급 확정 처리
    $("#confirmPay").on("click", function() {
        const emplNo = $(this).data("empl-no");
        console.log("emplNo : ", emplNo);
        $.ajax({
            url: "/hrms/payStub",
            method: "POST",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify({ emplNos: [emplNo] }),
            success: function(response) {
                showToastMessage("✅ 급여 지급이 확정되었습니다.", "success");
                $("#payStubModal").css("display", "none");
                location.reload();
            },
            error: function(error) {
                showToastMessage("❌ 급여 지급 확정에 실패했습니다.", "danger");
                console.error(error);
            }
        });
    });

    $("#downloadPdf").on("click", function () {
      const { jsPDF } = window.jspdf;
      const doc = new jsPDF('p', 'mm', 'a4');
    
      // 폰트 등록
      doc.addFileToVFS('malgun.ttf', _fonts);
      doc.addFont('malgun.ttf','malgun', 'normal');
      doc.setFont('malgun', 'normal');
    
      // ✅ 로고 이미지 추가 (좌측 상단)
      doc.addImage(_logo, 'PNG', 10, 3, 30, 30);

      // (1) 지급 예정일에서 연도와 월 추출
      const payDateStr = $("#modalPayDate").text();  // 예: "2023-02-19"
      let titleText = '급여명세서'; // 기본값
      if (payDateStr) {
        // 'YYYY-MM-DD' 구조이므로 split
        const [year, month] = payDateStr.split('-');
        // parseInt로 월 앞의 0 제거 (예: "02" -> 2)
        titleText = `${year}년 ${parseInt(month, 10)}월 급여명세서`;
      }
    
      // (2) 문서 제목
      doc.setFontSize(16);
      // A4 세로 기준, 가로 중앙 = 105
      doc.text(titleText, 105, 20, { align: 'center' });
    
      // (3) 사원 정보 테이블
      const empInfo = [
        ["부서", $("#modalDeptName").text(), "지급 예정일", $("#modalPayDate").text()],
        ["성명", $("#modalEmpName").text(), "직급", $("#modalPosition").text()],
      ];
      doc.autoTable({
        startY: 30,
        head: [['사원 정보', '', '지급 정보', '']],
        body: empInfo,
        theme: 'grid',
        headStyles: {
          fillColor: [30, 144, 255],
          textColor: 255,
        },
        columnStyles: {
          1: { cellWidth: 40 },
          3: { cellWidth: 40 },
        },
        styles: {
          font: 'malgun',
          fontSize: 12,
          lineColor: 200,
          lineWidth: 0.1,
        },
        margin: { left: 15, right: 15 },
      });
    
      // (4) 지급/공제 내역 테이블
      const payData = [
        ["기본급", $("#modalBasicSalary").text(), "소득세", $("#modalIncomeTax").text()],
        ["시간 외 수당", $("#modalOvertimePay").text(), "지방세", $("#modalLocalTax").text()],
        ["식대", $("#modalMealPay").text(), "고용보험", $("#modalEmploymentInsurance").text()],
        ["상여금", $("#modalBonus").text(), "건강보험", $("#modalHealthInsurance").text()],
        ["", "", "장기요양보험", $("#modalNursingInsurance").text()],
        ["", "", "국민연금", $("#modalNationalPension").text()],
      ];
      doc.autoTable({
        startY: doc.autoTable.previous.finalY + 10,
        head: [['지급 항목', '금액 (₩)', '공제 항목', '금액 (₩)']],
        body: payData,
        theme: 'grid',
        headStyles: {
          fillColor: [46, 134, 193],
          textColor: 255
        },
        columnStyles: {
          1: { halign: 'right' },
          3: { halign: 'right' },
        },
        styles: {
          font: 'malgun',
          fontSize: 12,
          lineColor: 200,
          lineWidth: 0.1,
        },
        margin: { left: 15, right: 15 },
      });
    
      // (5) 총 지급액 & 실 지급액 강조
      const yPos = doc.autoTable.previous.finalY + 15;
      doc.setFontSize(12);
      doc.setTextColor(0, 0, 0);
      doc.text(`총 지급액: ${$("#modalTotalPayment").text()}`, 15, yPos);
    
      // 실 지급액 (오른쪽 정렬)
      const pageWidth = doc.internal.pageSize.getWidth();
      doc.setFontSize(15);
      doc.setTextColor(0, 0, 0);
      doc.text(
        `실 지급액: ${$("#modalActualSalary").text()}`,
        pageWidth - 15, // 오른쪽에서 15mm 여백
        yPos,
        { align: 'right' }
      );
    
      // (6) PDF 저장
      doc.save(titleText + '.pdf');
    });
    
     // ✅ 전체 선택 체크박스 클릭 이벤트
    $("#emplNoCheckAll").on("change", function() {
      let isChecked = $(this).prop("checked");
      $("input[name='emplNo']").prop("checked", isChecked);
    });

    // 개별 체크박스 클릭 시 전체 선택 체크 여부 업데이트
    $(document).on("change", "input[name='emplNo']", function() {
        let total = $("input[name='emplNo']").length;
        let checked = $("input[name='emplNo']:checked").length;
        $("#emplNoCheckAll").prop("checked", total === checked);
    });

    // ✅ 일괄 지급 버튼 클릭 시 (선택된 사원 전체)
    $(".btn-open-modal").on("click", function() {
      let selectedEmplNos = [];
      $("input[name='emplNo']:checked").each(function() {
          selectedEmplNos.push($(this).val());
      });
  
      if (selectedEmplNos.length === 0) {
          showToastMessage("⚠️ 선택된 사원이 없습니다.", "warning");
          return;
      }
  
      // ✅ 각 사원의 지급 가능 여부 확인 후 일괄 지급 진행
      Promise.all(
          selectedEmplNos.map((emplNo) =>
              $.ajax({
                  url: `/hrms/payStub/view/${emplNo}`, // 🔥 지급 상태 조회
                  type: "post"
              })
          )
      ).then((results) => {
          const eligibleEmplNos = [];
          const ineligibleEmplNos = [];
  
          // ✅ 지급 가능 여부 판단
          results.forEach((data, idx) => {
              if (data.PAY_AT === 'N') {
                  eligibleEmplNos.push(selectedEmplNos[idx]);
              } else if (data.PAY_AT === 'Y' && data.PAY_ELIGIBLE === 'Y') {
                  eligibleEmplNos.push(selectedEmplNos[idx]);
              } else {
                  ineligibleEmplNos.push(selectedEmplNos[idx]);
              }
          });
  
          if (ineligibleEmplNos.length > 0) {
  
              setTimeout(() => {
                  if (eligibleEmplNos.length === 0) {
                      showToastMessage("⚠️ 지급 가능한 사원이 없습니다.", "warning");
                      return;
                  }
  
                  showConfirmModal(`일부 사원의 급여가 확정되어 제외됐습니다. \n총 ${eligibleEmplNos.length}명의 급여를 지급하시겠습니까?`)
                      .then((isConfirmed) => {
                          if (isConfirmed) {
                              $.ajax({
                                  url: "/hrms/payStub",
                                  type: "POST",
                                  contentType: "application/json;charset=utf-8",
                                  data: JSON.stringify({ emplNos: eligibleEmplNos }),
                                  success: function(response) {
                                      showToastMessage("✅ 선택된 사원의 급여가 지급되었습니다.", "success");
                                      setTimeout(() => location.reload(), 1000); // 💡 지급 후 1초 대기 후 새로고침
                                  },
                                  error: function(error) {
                                      showToastMessage("❌ 급여 지급에 실패했습니다.", "danger");
                                      console.error(error);
                                  }
                              });
                          }
                      });
              });
          } else {
              // ✅ 지급 불가 사원이 없는 경우 즉시 모달 실행
              showConfirmModal(`총 ${eligibleEmplNos.length}명의 급여를 지급하시겠습니까?`)
                  .then((isConfirmed) => {
                      if (isConfirmed) {
                          $.ajax({
                              url: "/hrms/payStub",
                              type: "POST",
                              contentType: "application/json;charset=utf-8",
                              data: JSON.stringify({ emplNos: eligibleEmplNos }),
                              success: function(response) {
                                  showToastMessage("✅ 선택된 사원의 급여가 지급되었습니다.", "success");
                                  setTimeout(() => location.reload(), 1000);
                              },
                              error: function(error) {
                                  showToastMessage("❌ 급여 지급에 실패했습니다.", "danger");
                                  console.error(error);
                              }
                          });
                      }
                  });
          }
      }).catch((error) => {
          showToastMessage("❌ 지급 상태 확인 중 오류가 발생했습니다.", "danger");
          console.error(error);
      });
  });
  


  getSelectBoxList();
  if(!sessionStorage.getItem("currentPage")){
    printList(1); // 페이지 최초로드시
  }else{
    printList(sessionStorage.getItem("currentPage"));
  }
  // 검색버튼 클릭이벤트
  searchBtn.on("click", function(){ 
    let emplNo = $("#emplNo").val();
    let emplNm = $("#emplNm").val();
    let emplPosition = $("#emplPosition").val();
    let deptCode = $("#deptCode").val();
    printList(1, emplNo, emplNm, emplPosition, deptCode);
  });
    
  // 페이지버튼 클릭이벤트
  pagingArea.on("click", "a", function(){ 
    event.preventDefault();
    let page = $(this).data("page");
    let emplNo = $("#emplNo").val();
    let emplNm = $("#emplNm").val();
    let emplPosition = $("#emplPosition").val();
    let deptCode = $("#deptCode").val();
    sessionStorage.setItem("currentPage", page);
    printList(page, emplNo, emplNm, emplPosition, deptCode);
  });
  
  $(document).on("click", "tr td:nth-child(3) a", function(event) {
      event.preventDefault(); // a 태그의 기본 동작 방지 (필요한 경우)
      
      // 클릭된 a 태그가 포함된 tr을 찾고, 해당 tr의 첫 번째 td의 텍스트 가져오기
      var emplNo = $(this).closest("tr").find("td:first").text().trim();
      console.log(emplNo); // 결과 출력
      location.href = "/hrms/admin/employeeDetail/" + emplNo
  });
});
  
  //목록가져오기 함수
  function printList(page, emplNo, emplNm, emplPosition, deptCode){
    let data = {page : page}
    if(emplNo != null){data.emplNo = emplNo}
    if(emplNm != null){data.emplNm = emplNm}
    if(emplPosition != null){data.emplPosition = emplPosition}
    if(deptCode != null){data.deptCode = deptCode}
    $.ajax({
      url : "/hrms/admin/selectEmplList",
      type : "post",
      data : JSON.stringify(data),
      contentType : "application/json;charset=utf-8",
      success : function(res){
        console.log(res);
        let tr = "";
        for(let i=0; i<res.emplList.length; i++){
          tr += `
            <tr>
              <td><input type="checkbox" name="emplNo" value="${res.emplList[i].emplNo}" id="emplNoCheck"></td></td>
              <td>${res.emplList[i].emplNo}</td>
              <td><a href="#">${res.emplList[i].emplNm}</a></td>
              <td>${res.emplList[i].emplPosition}</td>
              <td>${res.emplList[i].deptCode}</td>
              <td>${res.emplList[i].teamCode}</td>
              <td><button class="btn btn-primary btn-view-stub" data-empl-no="${res.emplList[i].emplNo}" data-empl-nm="${res.emplList[i].emplNm}", data-dept-name="${res.emplList[i].deptCode}", data-empl-position="${res.emplList[i].emplPosition}">미리보기</button></td>
            </tr>
          `;
        }
        table_tbody.html(tr);
        pagingArea.html(res.pageVO.pagingHTML)
      },
      error : function(error){
        console.log(error);
      }
    });
  }
  
  function getSelectBoxList(){
    $.ajax({
      url : "/hrms/admin/getSelectBoxList",
      type : "post",
      success : function(res){
        console.log(res);
        let deptOptions = "<option value='' selected>부서</option>";
        for(let i=0; i<res.deptCode.length; i++){
          deptOptions += `
            <option value="${res.deptCode[i].deptCode}">${res.deptCode[i].deptName}</option>
          `;
        }
        let emplPositionOptions = "<option value='' selected>직급</option>";
        for(let i=0; i<res.emplPosition.length; i++){
          emplPositionOptions += `
            <option value="${res.emplPosition[i].ccCode}">${res.emplPosition[i].ccName}</option>
          `;
        }
        
        deptCode.html(deptOptions);
        emplPosition.html(emplPositionOptions);
        
      },
      error : function(error){console.log(error);}
    });
  }


