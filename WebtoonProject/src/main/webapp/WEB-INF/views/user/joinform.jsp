<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<!-- ȸ������ ������ ���� -->
<!-- �ڹ� ��ũ��Ʈ ������ ����ϱ� ���� Ÿ�Լ��� -->
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
    function idCheck(id) { //idCheck(id) �Լ��� id�ߺ�Ȯ�� ��ư�� Ŭ���ϸ� ȣ��Ǵ� �Լ�
        frm = document.regFrm; //��ư�� Ŭ������ �� ȸ������ ���� ���̵� ���� ������ ��� �޽����� ������ ���������� �Է��ϸ�
        //ID �ߺ�üũ(idCheck.jsp)�� ���̵� ���� �Բ� �Ѿ��.
        if (id == "") {
            alert("���̵� �Է��� �ּ���.");
            frm.id.focus();
            return;
        }
        url = "IDCheck.jsp?ID=" + ID;
        window.open(url, "IDCheck", "width=300,height=150");
    }
 
   
</script>
</head>
<body bgcolor="FFFFCC" onLoad="regFrm.id.focus()">
    <!-- ������ �ε� �� ���ΰ�ħ�� �߻��Ǹ� ��Ŀ���� ID�Է¶����� ��ġ�մϴ�. -->
    <div align="center">
        <br /> <br />
        <form name="regfrm" method="post" action="memberProc.jsp">
            <!--memberProc.jsp���Ͽ� regfrm�̶�� ������ post������� ���� �����Ѵ�. -->
            <table align="center" border="0" cellspacing="0" cellpadding="5">
                <!-- cellspacing�� ���̺��� �ܰ��� ���� ������ �β��� ����, cellpadding�� �а� ������ ���̸� �����ϴ� �±� -->
 
 
                <tr>
                    <td align="center" valign="middle" bgcolor="#FFFFCC">
                        <table border="1" cellspacing="0" cellpadding="2" align="center"
                            width="600">
                            <tr align="center" bgcolor="#996600">
                                <td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
                            </tr>
 
 
                            <tr>
                                <td width="20%">���̵�</td>
                                <td width="50%"><input name="id" size="15"> <input
                                    type="button" value="ID�ߺ�Ȯ��"
                                    onClick="IDCheck(this.form.ID.value)"></td>
                                <!-- onClick�� �Է��� ���̵� �ߺ��� ������ Ȯ�� -->
                                <td width="30%">���̵� ���� �ּ���.</td>
                            </tr>
 
                            <tr>
                                <td>�н�����</td>
                                <td><input type="PWD" name="PWD" size="20"></td>
                                <td>�н����带 �����ּ���.</td>
                            </tr>
 
                            <tr>
                                <td>�н����� Ȯ��</td>
                                <td><input type="PWD" name="REPWD" size="20"></td>
                                <td>�н����带 Ȯ���մϴ�.</td>
                            </tr>
 
                            <tr>
                                <td>�̸�</td>
                                <td><input name="NAME" size="15"></td>
                                <td>�̸��� �����ּ���.</td>
                            </tr>
 
                            <tr>
                                <td>Email</td>
                                <td><input name="EMAIL" size="30"></td>
                                <td>�̸����� ���� �ּ���.</td>
                            </tr>
 
                            <tr>
                                <td colspan="3" align="center"><input type="button"
                                    value="ȸ������" onclick="inputCheck()"> &nbsp; &nbsp; <input
                                    type="reset" value="�ٽþ���"> &nbsp; &nbsp; <input
                                    type="button" value="�α���"
                                    onClick="javascript:location.href='login.jsp'"></td>
                            </tr>
 
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
