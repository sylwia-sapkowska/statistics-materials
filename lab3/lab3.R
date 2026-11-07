tank_experiment <- function(n, N_true = 255) {
  x <- runif(n, min=0, max=N_true)
  N_hat_mm = 2 * mean(x)
  N_hat_mle = max(x) * (n+1) / n
  return(c(Metoda_Momentow = N_hat_mm, MLE = N_hat_mle))
}

N_sim = 500
N_true = 255

results <- as.data.frame(t(replicate(N_sim, tank_experiment(n=5, N_true=N_true))))

results_long = stack(results)

library(ggplot2)

ggplot(results_long, aes(x=ind, y=values, color=ind)) + 
  geom_jitter(alpha = 0.3, width=0.15) + 
  geom_hline(yintercept = N_true, linetype="dashed", color="red", size=1) + 
  stat_summary(fun.data = "mean_sdl", color="black", size=0.8) + 
  theme_minimal() + 
  labs(title = "German Tank Problem (n=5, True N = 255)", x= "Metoda estymacji", y = "Szacowana liczba czolgow") + 
  theme(legend.position = "none")


bus_experiment <- function(liczba_autobusow=100) {
  odstepy = rexp(liczba_autobusow, rate=0.1)
  momenty_przyjazdu <- cumsum(odstepy)
  
  moment_pasazera <- runif(1, min=momenty_przyjazdu[1], max = momenty_przyjazdu[100])
  autobusy_po_pasazerze <- momenty_przyjazdu[momenty_przyjazdu >= moment_pasazera]
  czas_oczekiwania = min(autobusy_po_pasazerze) - moment_pasazera
  return(czas_oczekiwania)
}

N_sim = 1000
czasy_czekania = replicate(N_sim, bus_experiment(liczba_autobusow = 100))
srednia_empiryczna = mean(czasy_czekania)
print(paste("Sredni czas oczekiwania: ", round(srednia_empiryczna, 3), " minut."))
mediana_empiryczna = median(czasy_czekania)
sd_empiryczne = sd(czasy_czekania)


hist(czasy_czekania, breaks=30, probability=TRUE, col="lightgray", border="white", 
     main = "Empiryczny rozklad", xlab = "Czas oczekiwania (w min)", ylab = "Gestosc pbienstwa")
abline(v=5, col="blue", lty=2, lwd=2)
abline(v=srednia_empiryczna, col="red", lty=1, lwd=2)
legend("topright", legend=c("intuicja (5 min)", "w praktyce (10 min)"), col=c("blue", "red"), lty=c(2, 1), lwd=2)
