https://www.hackerrank.com/challenges/contest-leaderboard/problem

/*
 hackers -> hacker_id, name
 submissions -> submission_id, hacker_id, challenge_id, score
 */
select h.hacker_id,
    h.name,
    sum(highest_score) as total_highest_score
from (
        select hacker_id,
            challenge_id,
            max(score) as highest_score
        from submissions
        group by hacker_id,
            challenge_id
    ) as highest_score_for_each_challenge
    join hackers h on h.hacker_id = highest_score_for_each_challenge.hacker_id
group by h.hacker_id,
    h.name
having total_highest_score > 0
order by total_highest_score desc,
    h.hacker_id