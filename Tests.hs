{-
-- Tests.hs
-- Contains all the tests for the loop-solver project and some test-tests.
--
-- Fundamentals unceremoniously stolen/borrowed from:
--  https://github.com/spockz/TravisHSTest/blob/master/Tests.hs
-}

import Test.QuickCheck
import Text.Printf

main = mapM_ (\(s,a) -> printf "%-25s: " s >> a) tests
{------------------------------------------------------------------------------}
-- Test-test. Shows that a double-reversed list is identical to the identity
prop_doubleReverse s = (reverse . reverse) s == id s
  where _ = s :: [Int]

-- Test-test. Intended to fail
prop_intentionalFailure s = reverse s == id s
  where _ = s :: [Int]
{------------------------------------------------------------------------------}
tests = [("doubleReverse/id", quickCheck prop_doubleReverse),
         ("intentionalFailure", quickCheck prop_intentionalFailure)]
