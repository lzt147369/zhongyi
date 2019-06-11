package com.zhongyi.admin.controller;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.zhongyi.common.base.ApiResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/6/10
 */
@Controller
public class ErweimaController {
    @RequestMapping("erweima")
    public String list() {

        return "admin/erweima/list";
    }

    @RequestMapping("duqu")
    @ResponseBody
    public void duqu(String bianhao, HttpServletResponse resp) throws IOException {
        ApiResponse apiResponse = new ApiResponse();
        ServletOutputStream stream = null;
       /* Long qrid=Long.parseLong(content);
        Ticket ticket=ticketRepository.findByTicketId(qrid);
       if (ticket!=null) {*/
        try {
            stream = resp.getOutputStream();
            Map<EncodeHintType, Object> hints = new HashMap<>();
            //编码
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            //边框距
            hints.put(EncodeHintType.MARGIN, 0);
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bm = qrCodeWriter.encode(bianhao, BarcodeFormat.QR_CODE, 200, 200, hints);
            MatrixToImageWriter.writeToStream(bm, "png", stream);
        } catch (WriterException e) {
            e.getStackTrace();

        } finally {

            if (stream != null) {
                stream.flush();
                stream.close();
            }
        }



    }
}
