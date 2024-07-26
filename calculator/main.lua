require "import"
import "android.widget.*"
import "android.view.*"
layout={
    LinearLayout;
    {
        EditText;
        hint="type hear";
        id="code"
    };
    {
        Button;
        text="calculate";
        onClick=function()
            local result,error=loadstring("return " .. code.getText().toString())
            if result then
                local success,output=pcall(result)
                resultText.setText(tostring(output))
            else
                resultText.setText(tostring(error))
            end
        end;
    };
    {
        TextView;
        id="resultText";
    }
}
dlg=LuaDialog()
dlg.setTitle("calculator")
dlg.setMessage("a calculator tool")
dlg.setView(loadlayout(layout))
dlg.show()