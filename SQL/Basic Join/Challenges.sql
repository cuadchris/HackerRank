https://www.hackerrank.com/challenges/challenges/problem


with hackers_and_their_counts as (
    select hacker_id,
        count(challenge_id) as hacker_challenge_count
    from challenges
    group by hacker_id
),
challenge_counts_and_occurences as (
    select hacker_challenge_count,
        count(hacker_challenge_count) as occurences
    from hackers_and_their_counts
    group by hacker_challenge_count
)
select h.hacker_id,
    h.name,
    hc.hacker_challenge_count
from hackers_and_their_counts hc
    join hackers h on h.hacker_id = hc.hacker_id
    join challenge_counts_and_occurences cco on cco.hacker_challenge_count = hc.hacker_challenge_count
where cco.occurences <= 1
    or hc.hacker_challenge_count = (
        select MAX(hacker_challenge_count)
        from hackers_and_their_counts
    )
order by hc.hacker_challenge_count desc,
    h.hacker_id