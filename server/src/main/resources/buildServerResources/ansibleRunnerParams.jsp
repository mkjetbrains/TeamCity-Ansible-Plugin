<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="forms" tagdir="/WEB-INF/tags/forms" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="bean" class="jetbrains.buildServer.runner.ansibleRunner.AnsibleBean"/>
<jsp:useBean id="propertiesBean" scope="request" type="jetbrains.buildServer.controllers.BasePropertiesBean"/>

<forms:workingDirectory/>

<tr id="playbook_file">
    <th><label for="${bean.playbookFileKey}">Playbook:</label></th>
    <td>
        <props:textProperty name="${bean.playbookFileKey}" className="longField"/>
        <bs:vcsTree fieldId="${bean.playbookFileKey}"/>
        <span class="smallNote">Path to the playbook file, absolute or relative to the working directory</span>
    </td>
</tr>

<tr id="inventory_file">
    <th><label for="${bean.inventoryFileKey}">Inventory:</label></th>
    <td>
        <props:textProperty name="${bean.inventoryFileKey}" className="longField"/>
        <bs:vcsTree fieldId="${bean.inventoryFileKey}"/>
        <span class="smallNote">Path to the inventory file, absolute or relative to the working directory</span>
    </td>
</tr>

<tr id="options">
    <th><label for="${bean.extraArgsKey}">Additional arguments:</label></th>
    <td>
        <props:textProperty name="${bean.extraArgsKey}" className="longField"/>
        <span class="smallNote">Additional arguments to be passed to the command</span>
    </td>
</tr>

<tr class="advancedSetting">
    <th>Options:</th>
    <td>
        <props:checkboxProperty name="${bean.dryRunKey}"/>
        <label for="${bean.dryRunKey}">Do a dry run</label>
    </td>
    <td>
        <props:checkboxProperty name="${bean.failOnChangesKey}"/>
        <label for="${bean.failOnChangesKey}">Fail build if changes were detected</label>
    </td>
</tr>