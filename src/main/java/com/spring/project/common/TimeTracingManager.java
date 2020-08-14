package com.spring.project.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TimeTracingManager {

	@Pointcut(value = "execution(* com..*Service.*(..))")
	private void servicePointcut() {
	};

	@Around("servicePointcut()")
	public Object trace(ProceedingJoinPoint joinPoint) throws Throwable {
		Signature s = joinPoint.getSignature();
		String methodName = s.getName();
		System.out.println("[Log]Before: " + methodName + " time check start");
		long startTime = System.nanoTime();
		Object result = null;

		result = joinPoint.proceed(); // joinpoint 실행 HelloService say메소드 실행해줌
		System.out.println("메소드 결과값: " +result);
		System.out.println("메소드 명 : " +methodName);
		System.out.println("[Log]Finally: " + methodName + " End.");
		long endTime = System.nanoTime();
		System.out.println("[Log]After: " + methodName + " time check end");
		System.out.println("[Log]" + methodName + " processing time is " + (endTime - startTime) + "ns");
		return result;

	}

}
