module SimpleMap
  ( Map
  , empty
  , insert
  , lookup
  , fromList
  , toAscList
  , union
  ) where

import Data.List (sortBy)
import Data.Function (on)
import Prelude hiding (lookup)

type Map k v = [(k,v)]

empty :: Map k v
empty = []

insert :: Eq k => k -> v -> Map k v -> Map k v
insert k v m = (k,v) : filter (\(k',_) -> k' /= k) m

lookup :: Eq k => k -> Map k v -> Maybe v
lookup _ [] = Nothing
lookup k ((k',v):xs)
  | k == k'   = Just v
  | otherwise = lookup k xs

fromList :: Eq k => [(k,v)] -> Map k v
fromList = foldr (uncurry insert) empty

toAscList :: Ord k => Map k v -> [(k,v)]
toAscList = sortBy (compare `on` fst)

union :: Eq k => Map k v -> Map k v -> Map k v
union m1 m2 = foldr (uncurry insert) m2 m1
