<%@ page contentType="text/html; charset=EUC-KR" %>

<%  
  //�����ؾ� �� ���� 
  String  url = null;
  String  str = null;
  
  url = request.getParameter("url");
  str = request.getParameter("str");
  if(str != null){
    str = str + "&";
  }
%>
<%  
  //������ �׺���̼� ���� ���� 
  // ���������� ������ �Խù��� ��
  int pageSize = 0; 
  // �׷��� ũ��
  int groupSize = 0;  
  // ��ü �Խù��� ����
  int totalCount = 0; 
  //���� ������
  int curPage = 0;  
  // ��ü �������� ����
  int pageCount = 0;
  
  if(request.getParameter("spg_pageSize") != null)
  {
    pageSize = Integer.parseInt(request.getParameter("spg_pageSize"));
  }
  
  if(request.getParameter("spg_groupSize") != null)
  {
    groupSize = Integer.parseInt(request.getParameter("spg_groupSize"));
  }
  
  if(request.getParameter("spg_curPage") != null)
  {
    curPage = Integer.parseInt(request.getParameter("spg_curPage"));
  }
  
  if(request.getParameter("spg_totalSize") != null)
  {
    totalCount = Integer.parseInt(request.getParameter("spg_totalSize"));
  }
  
  System.out.println("pageSize 1>>> : " + pageSize);
  System.out.println("groupSize 1>>> : " + groupSize);
  System.out.println("curPage 1>>> : " + curPage);
  System.out.println("totalCount 1>>> : " + totalCount);
  
  // ��ü�Խù����� ������ũ�⸦ ������ ��ü ������ ������ �����.
  // �Ҽ����� ���� ������ ������ ������ �Ѱ���.
  pageCount = (int)Math.ceil((float)totalCount / (float)pageSize);
  
  // ����׷� ����
  int curGroup = (curPage-1) / groupSize;
  int linkPage = curGroup * groupSize;
%>
<p align="center">
<%
  // ù��° �׷��� �ƴѰ��
  if(curGroup > 0) {
%>
  <a href="<%=url%>?<%=str%>spg_curPage=1">����</a>&nbsp;&nbsp;&nbsp;
  <a href="<%=url%>?<%=str%>spg_curPage=<%=linkPage%>">��</a>&nbsp;&nbsp;&nbsp;
<%
  }
  else
  {
%>
����&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
<%
  }
  
  // ���� ��ũ�� ���� ������Ŵ
  linkPage++;
  
  int loopCount = groupSize;
  // �׷���������� ������ ��ũ����.
  while((loopCount > 0) && (linkPage <= pageCount))
  {
	 System.out.println("linkPage >>> " + linkPage);
	 System.out.println("curPage >>> " + curPage);
    if(linkPage == curPage)
    {
%>
  <%=linkPage%>
<%
    }
    else
    {
%>
  [<a href="<%=url%>?<%=str%>spg_curPage=<%=linkPage%>"><%=linkPage%></a>]&nbsp;
<%
    }
    
    linkPage++;
    loopCount--;
  }
  System.out.println("linkPage >>> " + linkPage);
  System.out.println("pageCount >>> " + pageCount);
  
  // �����׷��� �ִ� ���
  if(linkPage <= pageCount)
  {
%>
  <a href="<%=url%>?<%=str%>spg_curPage=<%=linkPage%>">��</a>&nbsp;&nbsp;&nbsp;
  <a href="<%=url%>?<%=str%>spg_curPage=<%=pageCount%>">����</a>&nbsp;&nbsp;&nbsp;
<%
  }
  else
  {
%>
  ��&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;
<%
  }
%>
</p>