-- People who see every feature, added by email on the People page.

-- Like a share, but for all features at once, so a link sent to them opens with no Request access.
-- By email, so it works before the person ever signs in. They see what a shared person sees:
-- people-facing documents of features that aren't archived. A removed row stays: the site deletes
-- nothing.
CREATE TABLE viewers (
  id bigserial PRIMARY KEY,
  email text NOT NULL,
  added_by bigint REFERENCES people (id),
  added_at timestamptz NOT NULL,
  removed_by bigint REFERENCES people (id),
  removed_at timestamptz
);
CREATE UNIQUE INDEX viewers_live ON viewers (email) WHERE removed_at IS NULL;
