--https://www.hackerrank.com/challenges/interviews/problem

/*
 CONTESTS -> contest_id, hacker_id, name
 COLLEGES -> college_id, contest_id
 CHALLENGES -> challenge_id, college_id
 VIEW_STATS -> challenge_id, total_views, total_unique_views
 SUBMISSION_STATS -> challenge_id, total_submissions, total_accepted_submissions
 
 OUTPUT:
 contest_id
 hacker_id
 name
 sum_of_total_submissions
 sum_total_accepted_submissions
 sum_total_views
 sum_total_unique_views
 sorted by contest_id
 */
 
with challenges_and_their_contest_id as (
    select chal.challenge_id,
        col.contest_id
    from challenges chal
        join colleges col on col.college_id = chal.college_id
),
challenges_total_views_total_unique_views as (
    select challenge_id,
        sum(total_views) as tv,
        sum(total_unique_views) as tuv
    from view_stats
    group by challenge_id
),
challenges_total_subs_total_acc_subs as (
    select challenge_id,
        sum(total_submissions) as ts,
        sum(total_accepted_submissions) as tas
    from submission_stats
    group by challenge_id
),
contest_id_total_views_total_unique_views as (
    select contest_id,
        sum(tv) as tv,
        sum(tuv) as tuv
    from challenges_and_their_contest_id cid
        join challenges_total_views_total_unique_views cv on cv.challenge_id = cid.challenge_id
    group by contest_id
),
contest_id_total_subs_total_acc_subs as (
    select contest_id,
        sum(ts) as ts,
        sum(tas) as tas
    from challenges_and_their_contest_id cid
        join challenges_total_subs_total_acc_subs cs on cs.challenge_id = cid.challenge_id
    group by contest_id
)
SELECT ct.contest_id,
    ct.hacker_id,
    ct.name,
    cits.ts,
    cits.tas,
    cid.tv,
    cid.tuv
FROM contests ct
    JOIN contest_id_total_views_total_unique_views cid ON cid.contest_id = ct.contest_id
    JOIN contest_id_total_subs_total_acc_subs cits ON cits.contest_id = cid.contest_id
ORDER BY ct.contest_id