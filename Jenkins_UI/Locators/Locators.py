# All the locators needed for executing the test case are in this Locators.py file

class Elements:

    def get_username_name(self):
        name = "j_username"
        return (name)

    def get_password_name(self):
        name = "j_password"
        return (name)

    def get_signIn_name(self):
        name = "Submit"
        return (name)

    def get_job_xpath(self):
        xpath = "//tbody/tr[@id='job_Demo_Job']/td[3]/a[1]"
        return (xpath)

    def get_delete_xpath(self):
        xpath = "//span[contains(text(),'Delete Project')]"
        return (xpath)

    def get_newitem_classname(self):
        classname = "task-link-text"
        return (classname)

    def get_projectname_id(self):
        id = "name"
        return (id)

    def get_projecttype_classname(self):
        classname = "hudson_model_FreeStyleProject"
        return (classname)

    def get_okbutton_id(self):
        id = "ok-button"
        return (id)

    def get_description_name(self):
        name = "description"
        return (name)

    def get_buildstep_xpath(self):
        xpath = "//body[1]/div[5]/div[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[200]/td[1]/div[1]/div[2]/span[1]/span[1]/button[1]"
        return (xpath)

    def get_commandtype_linktext(self):
        linktext = "Execute Windows batch command"
        return (linktext)

    def get_command_name(self):
        name = "command"
        return (name)

    def get_savebutton_xpath(self):
        xpath = "//button[contains(text(),'Save')]"
        return (xpath)

    def get_build_xpath(self):
        xpath = "//span[contains(text(),'Build Now')]"
        return (xpath)

    def get_lastbuild_xpath(self):
        xpath = "//a[contains(text(),'Last build')]"
        return (xpath)

    def get_consoleoutput_xpath(self):
        xpath = "//span[contains(text(),'Console Output')]"
        return (xpath)

    def get_consoleoutputtext_xpath(self):
        xpath = "//body[1]/div[4]/div[2]/pre[1]"
        return (xpath)

    def get_account_xpath(self):
        xpath = "//header/div[3]/a[1]"
        return (xpath)

    def get_configure_xpath(self):
        xpath = "//span[contains(text(),'Configure')]"
        return (xpath)

    def get_addnew_xpath(self):
        xpath = "/html[1]/body[1]/div[5]/div[2]/form[1]/table[1]/tbody[1]/tr[9]/td[3]/div[1]/div[2]/span[1]/span[1]/button[1]"
        return (xpath)

    def get_token_xpath(self):
        xpath = "//tbody/tr[9]/td[3]/div[1]/div[2]/div[2]/div[1]/input[2]"
        return (xpath)

    def get_generate_xpath(self):
        xpath = "//button[contains(text(),'Generate')]"
        return (xpath)

    def get_revoke_xpath(self):
        xpath = "//tbody/tr[9]/td[3]/div[1]/div[2]/div[2]/div[1]/span[2]/a[1]/*[1]"
        return (xpath)

e = Elements()
