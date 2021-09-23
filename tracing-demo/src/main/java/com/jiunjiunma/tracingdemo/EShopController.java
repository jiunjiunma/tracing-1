package com.jiunjiunma.tracingdemo;

import io.jaegertracing.Configuration;
import io.jaegertracing.internal.JaegerTracer;
import io.opentracing.Span;
import io.opentracing.Tracer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RestController
public class EShopController {
    private static final Tracer tracer = Configuration.fromEnv("EShop").getTracer();

    /*
    public static JaegerTracer initTracer(String service) {
        Configuration.SamplerConfiguration samplerConfig = Configuration.SamplerConfiguration.fromEnv().withType("const").withParam(1);
        Configuration.ReporterConfiguration reporterConfig = Configuration.ReporterConfiguration.fromEnv().withLogSpans(true);
        Configuration config = new Configuration(service).withSampler(samplerConfig).withReporter(reporterConfig);
        return config.getTracer();
    }
     */

    @RequestMapping("/checkout")
    public String checkout() {
        Span span = tracer.buildSpan("checkout").start();
        String result = "You have successfully checked out your shopping cart";
        span.finish();
        return result;
    }
}
