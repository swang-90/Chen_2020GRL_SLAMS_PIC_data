Pro plot_figure4e_4h
  restore,f='pic_data_figure4e-4h.sav'

     x1=0.2
   x2=0.9
   y0=0.17
   y1=0.95
   nvar=4
   dely=(y1-y0)/nvar

   c=initialize(0,750*2,560*2,dev='Z',res_fac=2)
res_fac=2
charsize=2.5

xrange=[0,900]

   ivar=0
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=[[by1],[bz1]]
   yr=[min(q,/nan),max(q,/nan)*1.1]
   plot,[0],xrange=xrange,yrange=yr,/xstyle,ystyle=1,$
        xtickformat='(A1)',ytitle='B',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=2*res_fac,position=pos,$
        thick=2*res_fac,/nodata,xticklen=0.06,yminor=5,ytickv=[-0.2,0,0.2],yticks=2
   oplot,x,by1,thick=2*res_fac,color=135
   oplot,x,bz1,thick=2*res_fac,color=230
   oplot,xrange,[0,0],linestyle=2,thick=1.5*res_fac
  xyouts,pos[2]+0.01,0.5*(pos[1]+pos[3])+0.2*dely,'y',/norm,font=1,charsize=charsize,color=135
  xyouts,pos[2]+0.01,0.5*(pos[1]+pos[3])-0.2*dely,'z',/norm,font=1,charsize=charsize,color=230
 
   ivar=1
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=[ex1]
   yr=[min(q,/nan),max(q,/nan)*1.1]
   plot,x,ex1,xrange=xrange,yrange=yr,/xstyle,ystyle=9,$
        xtickformat='(A1)',ytitle='E!Dx!N',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=1.5*res_fac,position=pos,$
        thick=2*res_fac,/noerase,xticklen=0.06,yminor=5,ytickv=[-0.01,0],yticks=1
   oplot,xrange,[0,0],linestyle=2,thick=1.5*res_fac
   plot,x,n1,xrange=xrange,yrange=[0.6,2.5],xstyle=5,ystyle=5,$
        font=1,charsize=charsize,position=pos,thick=1.5*res_fac,color=40,/noerase
   axis,/yaxis,yrange=[0.6,2.5],ytickv=[1,2],yticks=1,yminor=5,color=40,ytitle='N',font=1,charsize=charsize,ythick=2*res_fac

      ivar=2
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=[[by2],[bz2]]
   yr=[min(q,/nan),max(q,/nan)*1.1]
   plot,[0],xrange=xrange,yrange=yr,/xstyle,ystyle=1,$
        xtickformat='(A1)',ytitle='B',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=2*res_fac,position=pos,$
        thick=2*res_fac,/nodata,xticklen=0.06,/noerase,yminor=5
   oplot,x,by2,thick=2*res_fac,color=135
   oplot,x,bz2,thick=2*res_fac,color=230
   oplot,xrange,[0,0],linestyle=2,thick=1.5*res_fac
 
   ivar=3
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=[ex2]*10
   yr=[min(q,/nan),max(q,/nan)*1.1]
   plot,x,ex2*10,xrange=xrange,yrange=yr,/xstyle,ystyle=9,$
        xtitle='x (d!Di!N)',ytitle='10E!Dx!N',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=2*res_fac,position=pos,$
        thick=1.5*res_fac,/noerase,xticklen=0.06,yminor=5
   oplot,xrange,[0,0],linestyle=2,thick=1.5*res_fac
   plot,x,n2,xrange=xrange,yrange=[0.9,1.2],xstyle=5,ystyle=5,$
        font=1,charsize=charsize,position=pos,thick=1.5*res_fac,color=40,/noerase
   axis,/yaxis,yrange=[0.9,1.2],ytickv=[1,1.2],yticks=1,yminor=2,color=40,ytitle='N',font=1,charsize=charsize,ythick=2*res_fac

   write_png,'figure4e_4h.png',tvrd(/true)
   print,'figure4e_4h.png'
END
