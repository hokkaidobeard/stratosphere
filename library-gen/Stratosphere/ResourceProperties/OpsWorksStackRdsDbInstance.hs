{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-opsworks-stack-rdsdbinstance.html

module Stratosphere.ResourceProperties.OpsWorksStackRdsDbInstance where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for OpsWorksStackRdsDbInstance. See
-- 'opsWorksStackRdsDbInstance' for a more convenient constructor.
data OpsWorksStackRdsDbInstance =
  OpsWorksStackRdsDbInstance
  { _opsWorksStackRdsDbInstanceDbPassword :: Val Text
  , _opsWorksStackRdsDbInstanceDbUser :: Val Text
  , _opsWorksStackRdsDbInstanceRdsDbInstanceArn :: Val Text
  } deriving (Show, Eq)

instance ToJSON OpsWorksStackRdsDbInstance where
  toJSON OpsWorksStackRdsDbInstance{..} =
    object $
    catMaybes
    [ (Just . ("DbPassword",) . toJSON) _opsWorksStackRdsDbInstanceDbPassword
    , (Just . ("DbUser",) . toJSON) _opsWorksStackRdsDbInstanceDbUser
    , (Just . ("RdsDbInstanceArn",) . toJSON) _opsWorksStackRdsDbInstanceRdsDbInstanceArn
    ]

instance FromJSON OpsWorksStackRdsDbInstance where
  parseJSON (Object obj) =
    OpsWorksStackRdsDbInstance <$>
      (obj .: "DbPassword") <*>
      (obj .: "DbUser") <*>
      (obj .: "RdsDbInstanceArn")
  parseJSON _ = mempty

-- | Constructor for 'OpsWorksStackRdsDbInstance' containing required fields
-- as arguments.
opsWorksStackRdsDbInstance
  :: Val Text -- ^ 'owsrdiDbPassword'
  -> Val Text -- ^ 'owsrdiDbUser'
  -> Val Text -- ^ 'owsrdiRdsDbInstanceArn'
  -> OpsWorksStackRdsDbInstance
opsWorksStackRdsDbInstance dbPasswordarg dbUserarg rdsDbInstanceArnarg =
  OpsWorksStackRdsDbInstance
  { _opsWorksStackRdsDbInstanceDbPassword = dbPasswordarg
  , _opsWorksStackRdsDbInstanceDbUser = dbUserarg
  , _opsWorksStackRdsDbInstanceRdsDbInstanceArn = rdsDbInstanceArnarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-opsworks-stack-rdsdbinstance.html#cfn-opsworks-stack-rdsdbinstance-dbpassword
owsrdiDbPassword :: Lens' OpsWorksStackRdsDbInstance (Val Text)
owsrdiDbPassword = lens _opsWorksStackRdsDbInstanceDbPassword (\s a -> s { _opsWorksStackRdsDbInstanceDbPassword = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-opsworks-stack-rdsdbinstance.html#cfn-opsworks-stack-rdsdbinstance-dbuser
owsrdiDbUser :: Lens' OpsWorksStackRdsDbInstance (Val Text)
owsrdiDbUser = lens _opsWorksStackRdsDbInstanceDbUser (\s a -> s { _opsWorksStackRdsDbInstanceDbUser = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-opsworks-stack-rdsdbinstance.html#cfn-opsworks-stack-rdsdbinstance-rdsdbinstancearn
owsrdiRdsDbInstanceArn :: Lens' OpsWorksStackRdsDbInstance (Val Text)
owsrdiRdsDbInstanceArn = lens _opsWorksStackRdsDbInstanceRdsDbInstanceArn (\s a -> s { _opsWorksStackRdsDbInstanceRdsDbInstanceArn = a })
