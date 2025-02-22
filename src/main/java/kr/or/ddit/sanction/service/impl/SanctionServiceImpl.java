package kr.or.ddit.sanction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.cmm.service.IFileService;
import kr.or.ddit.cmm.service.INotificationService;
import kr.or.ddit.cmm.utils.FileUploadUtils;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.sanction.mapper.ISanctionMapper;
import kr.or.ddit.sanction.service.ISanctionService;
import kr.or.ddit.sanction.vo.DocSortVO;
import kr.or.ddit.sanction.vo.DocumentVO;
import kr.or.ddit.sanction.vo.HistoryVO;
import kr.or.ddit.sanction.vo.ReferenceVO;
import kr.or.ddit.sanction.vo.SanctionerVO;

@Service
public class SanctionServiceImpl implements ISanctionService {
	
	@Autowired
	private ISanctionMapper mapper;
	
	@Autowired
	private IFileService fileService;
	
	@Autowired
	private INotificationService nfService;
	
	@Override
	public List<DocSortVO> getDocSort() {
		
		List<DocSortVO> dvo = mapper.getDocSort();
		
		return dvo;
	}

	@Override
	public EmployeeVO getEmplInfo(String userId) {

		EmployeeVO evo = mapper.getEmplInfo(userId);
		
		return evo;
	}

	@Override
	public EmployeeVO getEmplRealInfo(EmployeeVO employeeVO) {

		EmployeeVO evo = mapper.getEmplRealInfo(employeeVO);
		
		return evo;
	}

	@Override
	public int createNewDoc(DocumentVO dvo) {
		
		String seq = fileService.selectFileSeq();
		
		if(dvo.getDocFile() != null) {
			
			for (MultipartFile file : dvo.getDocFile()) {
		        try {
					String filePath = FileUploadUtils.uploadFile(file); // 파일 c드라이브에 저장하기
					fileService.insertFile(file, filePath, seq); // 파일 DB에 인서트하기
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		dvo.setFileIdentify(seq);
		int cnt = mapper.createNewDoc(dvo);
		
		// 받아온 결재자 사원번호 목록
		List<String> aprList = dvo.getAprList();
		
		// 결재 순번용 변수 초기화
		int flowOrder = 1;
		
		// 결재자 insert
		for(String aprEmplNo : aprList) {
			SanctionerVO svo = new SanctionerVO();
			svo.setDocNo(dvo.getDocNo());
			svo.setSanctnerNo(aprEmplNo);
			svo.setSanctnerAct(aprEmplNo);
			svo.setSanctnFlow(flowOrder++);
			svo.setSanctnStatus("01");
			mapper.createSanctner(svo);
			nfService.sendNotification(aprEmplNo, "새로운 결재 요청이 도착하였습니다.", "02");
		}
		
		// 받아온 참조자 사원번호 목록
		List<String> refList = dvo.getRefList();
		
		// 참조자 insert
		for(String refEmplNo : refList) {
			ReferenceVO rvo = new ReferenceVO();
			rvo.setDocNo(dvo.getDocNo());
			rvo.setRefNo(refEmplNo);
			mapper.createReference(rvo);
			nfService.sendNotification(refEmplNo, "새로운 결재 요청이 도착하였습니다.", "02");
		}
		
		return cnt;
	}

	@Override
	public List<DocumentVO> getDocumentsInfo(String userId) {
		
		List<DocumentVO> dvo = mapper.getDocumentsInfo(userId);
		
		return dvo;
	}

	@Override
	public List<DocumentVO> getApvDocInfo(String userId) {
		
		List<DocumentVO> dvo = mapper.getApvDocInfo(userId);
		
		return dvo;
	}

	@Override
	public DocumentVO getApvDocDetail(String docNo) {
		
		DocumentVO dvo = mapper.getApvDocDetail(docNo);
		
		return dvo;
	}

	@Override
	public int apvStatusUpdate(String userId, String docNo) {
		
		int cnt = mapper.apvStatusUpdate(userId, docNo);
		
		return cnt;
	}

	@Override
	public int allowUpdate(String userId, String docNo) {
		
		int cnt = mapper.allowUpdate(userId, docNo);
		
		return cnt;
	}

	@Override
	public EmployeeVO getSanctnerSign(String userId) {
		
		EmployeeVO evo = mapper.getSanctnerSign(userId);
		
		return evo;
	}

	@Override
	public int docSignUpdate(DocumentVO evo) {
		
		int cnt = mapper.docSignUpdate(evo);
		
		return cnt;
	}

	@Override
	public SanctionerVO thisDocApvStatus(SanctionerVO svo) {
		
		SanctionerVO svo2 = mapper.thisDocApvStatus(svo);
		
		return svo2;
	}

	@Override
	public int proxyUpdate(SanctionerVO svo) {
		
		int cnt = mapper.proxyUpdate(svo);
		
		return cnt;
	}

	@Override
	public EmployeeVO nowEmplInfo(String userId) {
		
		EmployeeVO evo = mapper.nowEmplInfo(userId);
		
		return evo;
	}

	@Override
	public int updateDocStatus(String docNo) {
		
		int cnt = mapper.updateDocStatus(docNo);
		
		return cnt;
	}

	@Override
	public int updateProxyDocContent(DocumentVO dvo) {
		
		int cnt = mapper.updateProxyDocContent(dvo);
		
		return cnt;
	}

	@Override
	public int historyInsert(HistoryVO hvo) {
		
		int cnt = mapper.historyInsert(hvo);
		
		return cnt;
	}

	@Override
	public DocumentVO getWriterNo(String docNo) {
		
		DocumentVO str = mapper.getWriterNo(docNo);
		
		return str;
	}

	@Override
	public int allowFinalStatus(String docNo) {
		
		int cnt = mapper.allowFinalStatus(docNo);
		
		return cnt;
	}

}
