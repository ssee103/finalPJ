package kr.or.ddit.sanction.service;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.sanction.vo.DocSortVO;
import kr.or.ddit.sanction.vo.DocumentVO;
import kr.or.ddit.sanction.vo.HistoryVO;
import kr.or.ddit.sanction.vo.SanctionerVO;

public interface ISanctionService {

	public List<DocSortVO> getDocSort();

	public EmployeeVO getEmplInfo(String userId);

	public EmployeeVO getEmplRealInfo(EmployeeVO employeeVO);

	public int createNewDoc(DocumentVO dvo);

	public List<DocumentVO> getDocumentsInfo(String userId);

	public List<DocumentVO> getApvDocInfo(String userId);

	public DocumentVO getApvDocDetail(String docNo);

	public int apvStatusUpdate(String userId, String docNo);

	public int allowUpdate(String userId, String docNo);

	public EmployeeVO getSanctnerSign(String userId);

	public int docSignUpdate(DocumentVO evo);

	public SanctionerVO thisDocApvStatus(SanctionerVO svo);

	public int proxyUpdate(SanctionerVO svo);

	public EmployeeVO nowEmplInfo(String userId);

	public int updateDocStatus(String docNo);

	public int updateProxyDocContent(DocumentVO dvo);

	public int historyInsert(HistoryVO hvo);

	public DocumentVO getWriterNo(String docNo);

	public int allowFinalStatus(String docNo);

}
