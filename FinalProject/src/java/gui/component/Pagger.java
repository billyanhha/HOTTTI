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
public class Pagger {
    public static String generate(int pageIndex, int gap,int maxPage,String currentUrl)
    {
        String result = "";
        if(pageIndex > gap+1 )
        {
          result+=  BaseWebComponent.generateHyperlink(currentUrl+"&page=1", "First");
        }
        for(int i=pageIndex-gap;i<pageIndex;i++)
        {
          if(i>0)  
          result+=  BaseWebComponent.generateHyperlink(currentUrl+"&page="+i, i+"");
        }
        result+= BaseWebComponent.generateTextBase(""+pageIndex);
        for(int i=pageIndex+1;i<=pageIndex+gap;i++)
        {
           if(i<=maxPage)
           result+= BaseWebComponent.generateHyperlink(currentUrl+"&page="+i, i+"");
        }
        
        if(pageIndex < maxPage - gap )
        {
           result+= BaseWebComponent.generateHyperlink(currentUrl+"&page="+maxPage, "Last");
        }
        return result;
    }
}
