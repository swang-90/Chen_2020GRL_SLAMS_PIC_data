FUNCTION initialize, win, xsize, ysize,nowin=nowin,res_fac=res_fac,dev=dev,$
                     fname=fname
    ; ..............
    ; Purpose: 
    ;  Like a 'header.h' file in c, to include the necessary
    ; device calls.
    ;
    ; Modification History:
    ; 4/7/2014
    ; ..............

    ; Print message.
    print, 'Initializing plot window...'

                                ; Use 'undecomposed' color, and retain
                                ; the plot windows so they do not
                                ; erase.

    if ~keyword_set(res_fac) then res_fac=1
    if ~keyword_set(dev) then dev='X'
    if !D.name ne dev then set_plot,dev
    if !D.name eq 'Z' then begin
       device,decomposed=0,set_pixel_depth=24,set_resolution=[xsize,ysize]
    endif else begin
       device, decomposed=0, retain=2
    endelse

    ; Set font to Helvetica Bold. 
    ; Notes: - need to use "font=1" in calls to PLOT, XYOUTS, etc.
    ;        - SET_FONT opens an extraneous window, IDL0.


    ; Load default colors for plotting
    loadct,33    ; rainbow + white as index 255
    ;loadct,20   ; 20 Hue Sat lightness2
    tvlct, red, green, blue, /get            ; store colortable 33 colors
    red(0) = 0 & green(0) = 0 & blue(0) = 0  ; set lowest color to black for axes labels
    red(255)=255 & green(255)=255 & blue(255)=255
    tvlct, red, green, blue 
    !p.color = 0
    !p.background = 255

    if ~keyword_set(nowin) and !D.name eq 'X' then $
    window, win, xsize=xsize, ysize=ysize
    if !D.name eq 'Z' then erase


    return, 0

END
