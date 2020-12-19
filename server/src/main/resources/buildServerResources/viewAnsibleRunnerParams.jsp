<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="forms" tagdir="/WEB-INF/tags/forms" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="bean" class="jetbrains.buildServer.runner.ansibleRunner.AnsibleBean"/>
<jsp:useBean id="propertiesBean" scope="request" type="jetbrains.buildServer.controllers.BasePropertiesBean"/>

<div class="parameter">
    Playbook: <props:displayValue name="${bean.playbookFileKey}" />
</div>

<div class="parameter">
    Inventory: <props:displayValue name="${bean.inventoryFileKey}" />
</div>

<div class="parameter">
    Additional arguments: <props:displayValue name="${bean.extraArgsKey}" />
</div>