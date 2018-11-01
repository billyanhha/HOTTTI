/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.component;

/**
 *
 * @author sonnt
 */
public class BaseWebComponent {
    public static String generateHyperlink(String url,String label)
    {
        return "<a style=\"margin-right: 10px  ; font-weight: bold ; color:#bababa\" href=\""+url+"\">" + label + "</a>";
    }
    
    public static String generateTextBase(String text)
    {
        return "<span style=\"margin-right: 10px ; font-weight: bold ; \" >"+text+"</span>";
    }
}
