---
name: register
description: Registration 101 for the Claude Certified Architect exams (Foundations and Professional) as a personal checklist - partner email requirement, the exam page, payment and partner discounts, the two Pearson VUE emails, scheduling online or at a test centre, the 48-hour reschedule and cancel window, the ID name match, retake waiting periods (14, 30, 90 days) and the limit of four attempts in a rolling 12 months. Facts as of October 2026. Use when someone asks "how do I register", "can I take the exam", "I need a partner email", "how do I reschedule", "when can I retake", "what happens on exam day", or gives an exam date.
argument-hint: "[foundations | professional] [exam date, e.g. 2026-11-20 14:00 Europe/Prague]"
---

# Registration 101

Arguments: `$ARGUMENTS`

Turn the facts below into a checklist for this user, with real dates where you can compute them. Facts are **as of October 2026**. Programs change: always add the line "Check the official FAQ before you rely on a date or a price: https://anthropic-partners.skilljar.com/page/faq-certifications". Never invent a fact that is not below or on an official page; if the user asks something not covered, send them to the FAQ or to the support addresses below.

## Step 1 - ask what you need (one AskUserQuestion, skip what `$ARGUMENTS` already says)

- Which exam: Architect - Foundations (CCAR-F) or Architect - Professional (CCAR-P).
- Do you have an email address at a company in the Claude Partner Network? (yes / my company is a partner but I am not sure the domain is linked / no)
- Exam date and time with time zone, if already booked; otherwise "not booked yet".
- Is this a first attempt or a retake (and how many earlier attempts in the last 12 months)?

## Step 2 - the facts

**Who can sit it**
- Registration needs a **partner email**: an address on a recognised domain of a company in the Claude Partner Network. Personal Gmail or Outlook addresses are refused; the Partner Academy says "You aren't signed in with a partner company employee email".
- If your employer is a partner but the domain is not recognised, email partner-support@anthropic.com. Linking a domain takes **7 to 10 days**, so ask early.
- No partner employer: Matt Zimak's guide describes the partner route Matt used (partners section): https://agentmatik.ai/guides/how-i-passed-the-claude-certified-architect-exam-as-a-non-developer
- You must be **18 or older**; age is checked against your ID at check-in.

**Where to start**
- Foundations exam page: https://anthropic-partners.skilljar.com/claude-certified-architect-foundations-certification
- Professional exam page: https://anthropic-partners.skilljar.com/claude-certified-architect-professional-certification
- All certifications (guides, terms, exam policy): https://anthropic-partners.skilljar.com/page/partner-certifications
- Before paying, download the exam guide and read the Certification Terms and Conditions and the Certification Exam Policy.

**Price and discounts**
- Foundations $125, Professional $175 (USD, before discount). The price at checkout already includes your company's partner-tier discount.
- Registered-tier partners pay full price. Select, Preferred and Global Premier partners get 50% off. Through 31 December 2026, Global Premier partners pay nothing.
- A paid registration is valid for **5 years**; you can register now and schedule later. (A partner that gives you access may set a shorter window of its own.)

**Pearson VUE**
- After paying, watch for **two emails from PearsonVUEConfirmation@e.pearson.com**: one with your Pearson username, one with a temporary password. They often land in spam.
- Sign in at Pearson's Anthropic page, accept the candidate agreement, set a new password and security questions: https://www.pearsonvue.com/us/en/anthropic.html
- Schedule online with a remote proctor (OnVUE) or at a Pearson test centre, in English or Japanese.

**Your name and ID**
- The name on your Pearson profile must match your government-issued photo ID **exactly**, including accents and diacritics.
- Corrections: email certifications-support@anthropic.com at least 24 hours before the exam (they take 24 to 48 business hours), in Latin characters. Matt's guide recommends the subject "Name Correction Request".
- A mismatch on the day can cost you the fee.

**Changing or cancelling**
- Reschedule or cancel at least **48 hours** before the appointment. Inside 48 hours you cannot change it; a no-show or a late change forfeits the fee. (The July 2026 exam guide says 24 hours; the FAQ and Pearson say 48, so plan for 48.)
- After a reschedule, wait for Pearson's confirmation email. No email: log in and check the new date is in your profile.
- Cancelling in Pearson frees the slot but is **not a refund**. For a refund, email certifications-support@anthropic.com.

**Before exam day**
- Accommodations for documented needs go through Pearson and must be approved **before** you schedule; request 10 or more days ahead.
- Online: run Pearson's system test on the exact machine and network you will use. Corporate networks and managed laptops can block it; if so, book a test centre. Candidates with an ID from Belarus, Cuba, North Korea, Russia, Syria or restricted regions of Ukraine must test at a centre.
- Plan about **135 minutes** in the seat for the 120-minute exam (check-in, instructions, a short survey). Arriving after the permitted late-arrival window forfeits the fee.
- Closed book: no notes, no AI assistants, no browser translation tools. Phone, watch and bag go in a locker at a centre.
- You accept a non-disclosure agreement before the first question. Exam content stays confidential, which is why this plugin only uses original practice questions.

**After the exam**
- You see your result on screen: the scaled score, pass or fail, and percent correct by domain.
- A pass brings an email from Credly to claim the badge. The credential is valid **12 months**; on-time renewal is a free, non-proctored assessment, and a lapsed credential means the full exam at full price.

**Retakes**
- Waiting periods: **14 days** after a first fail, **30 days** after a second, **90 days** after a third.
- At most **4 attempts per exam in a rolling 12 months**. The limit is per exam: failing one does not block another.
- Each retake is the full fee, with your partner discount. Register again on the exam page; Pearson only offers dates after the waiting period.

**Exam content changes**
- On **7 December 2026** the Associate, Developer - Foundations and Architect - Professional exams switch to updated content. The updated guides are published on **17 November 2026**. Testing on or after 7 December: prepare with the new guide. Architect - Foundations is not on that list.

**Support**
- Name corrections and refunds: certifications-support@anthropic.com
- Partner email domains: partner-support@anthropic.com
- Scheduling, accommodations, results: Pearson VUE support, https://www.pearsonvue.com/us/en/anthropic.html
- Anthropic's step-by-step registration guide with screenshots (PDF): https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2F6nizmqk8tpzpfjvt6qmmav7rh%2Fpublic%2F1783542947%2FClaude+Certification+Program+-+Exam+Registration+Guide.pdf

## Step 3 - the personal checklist

Output a checklist of tick boxes, in order, with the user's own dates. Compute and show, in the user's time zone:

- **Last moment to reschedule or cancel** = appointment time minus 48 hours.
- **Last day to request a name correction** = appointment minus 24 hours, and say to do it now, since it takes up to 48 business hours.
- **Leave-home time** if they test at a centre: suggest arriving 30 minutes early; ask the travel time if unknown.
- **Professional only:** if the exam date is on or after 7 December 2026, flag that they need the guide published on 17 November 2026, and that preparation material written before then may not match.
- **Retake:** earliest possible retake date from their last attempt and attempt count, and how many attempts remain in the rolling 12 months.
- **No partner email yet:** put "get a partner email" first, with the 7 to 10 day domain-link time and the link to Matt's guide.

End with the FAQ line, and one line pointing to `/cert-coach:foundations` (or `/cert-coach:professional`) for the study plan.
