Pro plot_figure4a_4d
  restore,f='pic_data_figure4a-4d_twci16.5.sav'

  x1=0.2
   x2=0.9
   y0=0.17
   y1=0.95
   nvar=4
   dely=(y1-y0)/nvar
   xrange=[600,900]

   c=initialize(0,750*2,560*2,dev='Z',res_fac=2)
res_fac=2
charsize=3.0

   ivar=0
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=bt
   yr=[min(q,/nan),max(q,/nan)*1.1]
   plot,[0],xrange=xrange,yrange=yr,/xstyle,ystyle=9,$
        xtickformat='(A1)',ytitle='|B|',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=2*res_fac,position=pos,$
        thick=2*res_fac,/nodata,xticklen=0.06,title=title,yminor=5
   oplot,x,bt,thick=2*res_fac

   q=n
   yr=[min(q,/nan),max(q,/nan)*1.1]
   plot,x,n,xrange=xrange,yrange=yrange,xstyle=5,ystyle=5,$
        xtickformat='(A1)',ytitle='',font=1,charsize=chrasize,$
        position=pos,thick=res_fac,color=230,/noerase
   axis,/yaxis,yrange=yrange,/ystyle,ythick=2*res_fac,ytitle='N',font=1,charsize=charsize,color=230

   ivar=1
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=[[bx],[by],[bz]]
   yr=[min(q,/nan)*1.1,max(q,/nan)*1.1]
   plot,x,bx,xrange=xrange,yrange=yr,/xstyle,ystyle=1,$
        xtickformat='(A1)',ytitle='B',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=2*res_fac,position=pos,$
        thick=2*res_fac,/nodata,xticklen=0.06,/noerase
   oplot,x,bx,thick=2*res_fac,color=40
   oplot,x,by,thick=2*res_fac,color=135
   oplot,x,bz,thick=2*res_fac,color=230
   oplot,xrange,[0,0],linestyle=2,thick=res_fac
   xyouts,pos[2]+0.02,0.5*(pos[1]+pos[3])+0.3*dely,'x',/norm,font=1,charsize=charsize,color=40
  xyouts,pos[2]+0.02,0.5*(pos[1]+pos[3])+0.*dely,'y',/norm,font=1,charsize=charsize,color=135
  xyouts,pos[2]+0.02,0.5*(pos[1]+pos[3])-0.3*dely,'z',/norm,font=1,charsize=charsize,color=230

   ivar=2
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   q=[[ex],[ey],[ez]]
   yr=[min(q,/nan)*1.1,max(q,/nan)*1.1]
   plot,x,bx,xrange=xrange,yrange=yr,/xstyle,ystyle=1,$
        xtickformat='(A1)',ytitle='E',font=1,charsize=charsize,$
        xthick=2*res_fac,ythick=2*res_fac,position=pos,$
        thick=2*res_fac,/nodata,xticklen=0.06,/noerase,ytickv=[-0.01,0,0.01],yticks=2,yminor=5
   oplot,x,ey,thick=2*res_fac,color=135
   oplot,x,ez,thick=2*res_fac,color=230
   oplot,x,ex,thick=2*res_fac,color=40
   oplot,x,ex_veb,color=100,linestyle=2,thick=res_fac
   oplot,xrange,[0,0],linestyle=2,thick=res_fac
   oplot,[610,640],[-0.009,-0.009],linestyle=2,thick=2*res_fac,color=100
   xyouts,650,-0.011,'-(V!De!NxB)!Dx!N',font=1,charsize=charsize,color=100

   

   ivar=3
   pos=[x1,y1-(ivar+1)*dely,x2,y1-ivar*dely]
   vxsub=0
     vrange=[-20,20]-vxsub
   plot,xi,vi,xtitle='x (d!Di!N)',ytitle='ion!Cv!Dx!N(V!DA!N)',$
       xrange=xrange,yrange=vrange,/xstyle,/ystyle,$
       position=pos,$
       font=1,charsize=charsize,xthick=2*res_fac,ythick=2*res_fac,/nodata,/noerase,xticklen=0.06,ytickv=[-20,0,20],yticks=2,yminor=4

  dx_v=xi[1]-xi[0]
  dv=vi[1]-vi[0]
  cnt=n_elements(xi)
  cnt_v=n_elements(vi)
  for i=0,cnt-1 do begin
     xx=(xi[i]+dx_v*0.5*[-1,1,1,-1])
     if min(xx) lt xrange[0] or max(xx) gt xrange[1] then continue
     for j=0,cnt_v-1 do begin
        yy=(vi[j]+dv*0.5*[-1,-1,1,1])-vxsub
        if min(yy) lt vrange[0] or max(yy) gt vrange[1] then continue
        polyfill,xx,yy,color=col_vx_ib[i,j]
     endfor

  endfor
  oplot,xrange,[0,0],thick=res_fac,linestyle=2
  ;oplot,x,uix/va,thick=2*res_fac
  axis,xaxis=0,xthick=2*res_fac,xtickformat='(A1)',xrange=xrange,/xstyle,xticklen=0.06
  axis,xaxis=1,xthick=2*res_fac,xtickformat='(A1)',xrange=xrange,/xstyle,xticklen=0.06
  axis,yaxis=0,ythick=2*res_fac,ytickformat='(A1)',ytickv=[-20,0,20],yticks=2,yminor=4

  min_i=1
  max_i=1000.
  nratio=0.5
  colorbar,position=[pos[2]+0.01,$
                     pos[1]+0.01,$
                     pos[2]+0.023,$
                     pos[3]-0.015],$
               /vertical,/right,bottom=0,ncolors=255,range=[min_i,max_i*(1-nratio)],$
           divisions=3,charsize=2.5,font=1,$
           /ylog,ytickv=[1,10,100,1000],ticklen=0.0001,minor=0

  write_png,'figure4a_4d.png',tvrd(/true)
  print,'figure4a_4d.png'
END
